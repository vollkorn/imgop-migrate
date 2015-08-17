/*
 * Pattern.cpp
 *
 *  Created on: Jul 29, 2015
 *      Author: lukas
 */

#include "Pattern.h"

using namespace llvm;

using jsoncons::json;

using optmig::Pattern;
using optmig::PatternDB;
using optmig::MatchResult;

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
Function *create_hw_interface(Function *pattern, const json &hwiface, std::map<Value *, uint64_t> &binding) {
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
  Function *F = Function::Create(fnty, Function::ExternalLinkage, "hwiface_" + hwiface_name);

  return F;
}

Pattern *Pattern::create_from_obj(LLVMContext &context, const json &pattern) {

  json attributes = pattern["attributes"];

  json hwiface = attributes["hw_interface"];

  std::string name = pattern["name"].as_string();

  dbgs() << "Loading pattern \"" << name << "\" into database\n";

  const AbstractCFG *H = AbstractCFG::deserialize(context, pattern);

  Function *PatternFn = H->get_function();

  std::map<Value *, uint64_t> binding;
  Function *HwFn = create_hw_interface(PatternFn, hwiface, binding);

  Pattern *p;
  if (H && !name.empty()) {
    p = new Pattern(name, HwFn, H, binding);
    p->view();
  }

  return p;
}

bool MatchResult::resolve_binding(std::vector<Value *> &value_binding) {

  std::map<Value *, uint64_t> &binding = P->get_binding();

  value_binding.resize(binding.size());

  unsigned num_bound = 0;
  // rhs value from pattern
  // lhs value from candidate
  for (auto it_binding = binding.begin(), end_binding = binding.end(); it_binding != end_binding; ++it_binding) {
    Value *rhs = (*it_binding).first;
    u_int8_t pos = (*it_binding).second;
    for (auto it = ExpressionMapping.begin(), end = ExpressionMapping.end(); it != end; ++it) {
      Expression *EP = (*it).first;
      Value *cval = nullptr;

      GraphMatcher<Expression>::AssignmentT &assignment = (*it).second;

      auto i = std::find_if(assignment.begin(), assignment.end(),
                            [&rhs](GraphMatcher<Expression>::AssignT a) { return a.first->getValue() == rhs; });

      if (i != assignment.end()) {
        // get assigned candidate node
        const ExpressionNode *cnode = assignment[(*i).first];
        cval = cnode->getValue();
      }

      if (cval) {
        cval->dump();
        value_binding[pos] = cval;
        num_bound++;
        break;
      }
    }
  }
  if (binding.size() != num_bound) {
    errs() << "Arguments not bound: " << (binding.size() - num_bound) << "\n";
    return false;
  }


  return true;
}

bool MatchResult::try_offload() {

  BasicBlock *Entry, *Exit;

  // Lambda to get BB from candidate CFG
  auto get_bb = [&](AbstractCFGNode::Label label)->BasicBlock * {
    auto it = std::find_if(
        CFGMapping->begin(), CFGMapping->end(),
        [&label](std::pair<const AbstractCFGNode *, const AbstractCFGNode *> n) { return n.first->instanceof(label); });

    if (it != CFGMapping->end())
      return (*it).second->getBasicBlock();

    return nullptr;
  };

  Entry = get_bb(AbstractCFGNode::ENTRY);
  Exit = get_bb(AbstractCFGNode::EXIT);

  if (!Entry && !Exit)
    return false;

  LLVMContext &context = Entry->getContext();

  std::vector<Value*> binding;
  resolve_binding(binding);

  Module *M = Entry->getParent()->getParent();

  BasicBlock *BB = BasicBlock::Create(context, "acc_offload", Entry->getParent(), Entry);

  // Alter control flow such that each predecessor of the matched control flow
  // goes through the accelerator BB
  for (pred_iterator it = pred_begin(Entry), end = pred_end(Entry); it != end; ++it) {
    BasicBlock *pred = *it;

    TerminatorInst *term = pred->getTerminator();

    if (BranchInst *br = dyn_cast<BranchInst>(term)) {
      for (int index = 0; index < br->getNumSuccessors(); ++index)
        if (br->getSuccessor(index) == Entry) {
          br->setSuccessor(index, BB);
          break;
        }

    } else
      errs() << "Dont know how to handle " << *term << "\n";
  }
  // Create prototype of external defined hw accelerator function
  IRBuilder<> builder(BB);
  Function *F = P->get_function();

  Function *proto = P->get_hwiface();

  M->getFunctionList().push_back(proto);

  CallInst *hwcall = builder.CreateCall(proto, binding);
  builder.CreateCondBr(hwcall, Entry, Exit);

  return true;
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

std::vector<MatchResult> PatternDB::find_matchings(const AbstractCFG *G, bool show_graphs) {

  std::vector<MatchResult> matchings;

  // look for each pattern if there is a match in the candidate CFG
  for (Pattern *p : db) {

    std::vector<GraphMatcher<AbstractCFG>::AssignmentT *> assignments;

    const AbstractCFG *H = p->getCFG();

    // Forward to next pattern if number of nodes in H is greater
    // than number of node in G -> no isomorphism possible
    if (std::distance(G->nodes_begin(), G->nodes_end()) < std::distance(H->nodes_begin(), H->nodes_end()))
      continue;

    if (!GraphMatcher<AbstractCFG>::find_isomorphisms(G, H, assignments, &PatternDB::CFGNarrow))
      continue;

    // Sort out invalid matchings
    for (auto it = assignments.begin(); it != assignments.end();) {

      GraphMatcher<AbstractCFG>::AssignmentT *A = *it;
      std::map<Expression *, GraphMatcher<Expression>::AssignmentT> ExpressionMappings;
      if (show_graphs)
        GraphMatcher<AbstractCFG>::show_matching_graph(G, H, A);
      bool assignment_valid = true;
      // For each assignment in the CFG try to match the expressions
      // of each block of the pattern to a block of the candidate
      // If no mapping of the pattern expressions can be established
      // the assignment is invalid
      for (auto it = A->begin(), end = A->end(); it != end; ++it) {

        const std::vector<Expression *> &PatternExpressions = ((*it).first)->get_expressions();
        const std::vector<Expression *> &CandidateExpressions = ((*it).second)->get_expressions();

        for (Expression *EP : PatternExpressions) {
          GraphMatcher<Expression>::AssignmentT &mapping = ExpressionMappings[EP];
          for (Expression *EC : CandidateExpressions)
            if (GraphMatcher<Expression>::match_binary_trees(EP, EC, mapping))
              break;
            else
              mapping.clear();
        }
        // Check if the assignment is valid
        std::for_each(PatternExpressions.begin(), PatternExpressions.end(), [&](Expression *EP) {

          auto it = ExpressionMappings.find(EP);
          assignment_valid &= !((*it).second.empty());
        });
      }

      if (!assignment_valid) {
        it = assignments.erase(it);
        delete A;
      } else {
        ++it;

        GraphMatcher<AbstractCFG>::print_assignment(dbgs(), A);
        matchings.push_back({ p, A, ExpressionMappings });
      }
    }
  }
  return matchings;
}

PatternDB &PatternDB::load(LLVMContext &context, const std::string &filename) {
  static PatternDB instance;

  if (instance.init)
    return instance;

  json json_db = json::parse_file(filename);
  json json_db_obj = json_db["db"];
  for (auto it = json_db_obj.begin_elements(); it != json_db_obj.end_elements(); ++it) {

    json pattern = (*it);

    Pattern *p = Pattern::create_from_obj(getGlobalContext(), pattern);

    if (p)
      instance.db.push_back(p);
  }

  instance.init = true;

  return instance;
}
