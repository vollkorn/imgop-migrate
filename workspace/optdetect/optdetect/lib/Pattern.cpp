/*
 * Pattern.cpp
 *
 *  Created on: Jul 29, 2015
 *      Author: lukas
 */

#include "Pattern.h"

using namespace llvm;

using jsoncons::json;

using namespace optmig;
// trim from start
static inline std::string &ltrim(std::string &s) {
  s.erase(s.begin(), std::find_if(s.begin(), s.end(), std::not1(std::ptr_fun<int, int>(std::isspace))));
  return s;
}

// trim from end
static inline std::string &rtrim(std::string &s) {
  s.erase(std::find_if(s.rbegin(), s.rend(), std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
  return s;
}

// trim from both ends
static inline std::string &trim(std::string &s) { return ltrim(rtrim(s)); }

static inline std::string normalize_value_name(std::string name) {

  // trim left, right, remove %
  auto pos = name.find("%");
  name.erase(pos, 1);
  trim(name);
  return name;
}
//, std::map<Value *, uint64_t> &binding
Function *create_hw_interface(Module &M, Function *pattern, const json &hwiface, std::map<Value *, uint64_t> &binding) {
  json hwiface_binding = hwiface["binding"];
  std::string hwiface_name = hwiface["name"].as_string();

  SmallVector<Type *, 8> ArgTy;

  LLVMContext &context = getGlobalContext(); // pattern->getContext();
  ValueSymbolTable &symtable = pattern->getValueSymbolTable();
  for (auto it = hwiface_binding.begin_elements(); it != hwiface_binding.end_elements(); ++it) {
    std::string valuename = ((*it)[0]).as_string();
    uint64_t argindex = ((*it)[1]).as_long();
    valuename = normalize_value_name(valuename);
    Value *val = symtable.lookup(valuename);
    if (!val) {
      errs() << "Could not resolve name in binding: " << valuename << "\n";
      return nullptr;
    }
    ArgTy.push_back(val->getType());
    binding.insert(std::make_pair(val, argindex));
  }

  FunctionType *fnty = FunctionType::get(FunctionType::getInt1Ty(context), ArgTy, false);
  Function *F = Function::Create(fnty, Function::ExternalLinkage, hwiface_name, &M);

  return F;
}

Pattern *Pattern::create_from_obj(Module &M, const json &pattern) {

  json attributes = pattern["attributes"];

  json hwiface = attributes["hw_interface"];

  std::string name = pattern["name"].as_string();

  dbgs() << "Loading pattern \"" << name << "\" into database\n";

  const AbstractCFG *H = AbstractCFG::deserialize(M.getContext(), pattern);

  Function *PatternFn = H->get_function();

  std::map<Value *, uint64_t> binding;
  Function *HwFn = create_hw_interface(M, PatternFn, hwiface, binding);

  Pattern *p;
  if (H && !name.empty()) {
    p = new Pattern(name, HwFn, H, binding);
//    p->view();
  }

  return p;
}


bool PatternDB::CFGNarrow(const AbstractCFGNode *n_H, const AbstractCFGNode *n_G) {
  const std::vector<Expression *> expr_of_H = n_H->get_expressions();
  const std::vector<Expression *> expr_of_G = n_H->get_expressions();

  // Check if assignment && branch expressions are available
  if (!expr_of_H.empty() && expr_of_G.empty())
    return false;

  if ((n_H->get_expression_by(Instruction::ICmp) && !n_G->get_expression_by(Instruction::ICmp)) ||
      (n_H->get_expression_by(Instruction::FCmp) && !n_G->get_expression_by(Instruction::FCmp)))
    return false;

  // Check labels
  ArrayRef<AbstractCFGNode::Label> label_H = n_H->get_labels();
  ArrayRef<AbstractCFGNode::Label> label_G = n_G->get_labels();

  // entry/exit anchors can be mapped to any node
  if (std::find_if(label_H.begin(), label_H.end(), [](AbstractCFGNode::Label label) {
        return (label == AbstractCFGNode::ENTRY || label == AbstractCFGNode::EXIT);
      }) != label_H.end())
    return true;

  bool labels_match = true;
  for (AbstractCFGNode::Label label : label_H) {
    auto it = std::find(label_G.begin(), label_G.end(), label);
    if (it == label_G.end())
      labels_match = false;
  }

  if (!labels_match)
    return false;

  return true;
}

std::vector<MatchResult> PatternDB::find_matchings(const AbstractCFG *G) {

  std::vector<MatchResult> matchings;

  if(!init)
	  return matchings;

  // look for each pattern if there is a match in the candidate CFG
  for (Pattern *p : db) {
	  PatternMatcher matcher(G, p, show_graphs, match_cfg_only);

	  if(matcher.match()){
		  std::vector<MatchResult>& result = matcher.get_matching_result();
		  matchings.insert(matchings.end(), result.begin(), result.end());
	  }
  }
  return matchings;
}

PatternDB &PatternDB::load(Module &M, const std::string &filename) {
  static PatternDB instance;

  if (instance.init)
    return instance;

  if(!sys::fs::exists(filename)){
	  errs() << "File does not exist: " << filename << "\n";
	  return instance;
  }

  json json_db = json::parse_file(filename);
  json json_db_obj = json_db["db"];
  for (auto it = json_db_obj.begin_elements(); it != json_db_obj.end_elements(); ++it) {

    json pattern = (*it);

    Pattern *p = Pattern::create_from_obj(M, pattern);

    if (p)
      instance.db.push_back(p);
  }

  instance.init = true;

  return instance;
}
