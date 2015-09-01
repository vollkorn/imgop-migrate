/*
 * Expression.cpp
 *
 *  Created on: Jul 28, 2015
 *      Author: lukas
 */

#include "llvm/ADT/StringExtras.h"

#include "llvm/IR/Module.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Support/Regex.h"
#include "llvm/ADT/StringExtras.h"

#include "Expression.h"
#include "AbstractCFG.h"

#include <string>

using namespace llvm;
using namespace optmig;

void ExpressionNode::print(raw_ostream &O, bool simple) const {

  O << getLabel() << "\n";
  if (!simple)
    O << *V << "\n";

  if (isInductionValue()) {
    ival->print(O);
  }
}

std::string ExpressionNode::getLabel() const {
  if (Instruction *inst = dyn_cast<Instruction>(V))
    return std::string(Instruction::getOpcodeName(inst->getOpcode()));
  else if (Argument *arg = dyn_cast<Argument>(V))
    return "arg";
  else if (Constant *_const = dyn_cast<Constant>(V))
    return "const";

  return "";
}

bool ExpressionNode::maps_to(const ExpressionNode &other) const {

  Value *v1 = getValue();
  Value *v2 = other.getValue();

  if (v1 == nullptr || v2 == nullptr)
    return false;

  if (v1->getType() != v2->getType())
    return false;

  if (Instruction *inst_1 = dyn_cast<Instruction>(v1))
    if (Instruction *inst_2 = dyn_cast<Instruction>(v2))
      if (inst_1->getOpcode() == inst_2->getOpcode())
        return true;

  // Check if constants are the same, except instantiation is set for this node
  if (ConstantInt *c1 = dyn_cast<ConstantInt>(v1))
    if (ConstantInt *c2 = dyn_cast<ConstantInt>(v2)) {
      bool equal = c2->getValue().eq(c1->getValue());
      if (equal)
        return true;
      return false;
    }

  if (ConstantFP *c1 = dyn_cast<ConstantFP>(v1))
    if (ConstantFP *c2 = dyn_cast<ConstantFP>(v2)) {

      APFloat::cmpResult r = c2->getValueAPF().compare(c1->getValueAPF());
      if (r == APFloat::cmpEqual)
        return true;

      return false;
    }

  if (Argument *arg_1 = dyn_cast<Argument>(v1))
    if (Argument *arg_2 = dyn_cast<Argument>(v2))
      return true;

  return false;
}

void Expression::delete_recursive(ExpressionNode *node) {

  std::vector<ExpressionNode *> children = node->Children;
  //  if (User *U = dyn_cast<User>(node->getValue()))
  //    U->dropAllReferences();
//  delete node;
  //XXX perform proper cleanup!
  for (auto it = children.begin(); it != children.end();) {
    delete_recursive(*it);

    it = children.erase(it);
  }
}

void Expression::setRoot(ExpressionNode *node) {

  auto it = std::find_if(Nodes.begin(), Nodes.end(), [&node](ExpressionNode *n) { return n == node; });

  if (it == Nodes.end()) {
    errs() << "Cannot set root node which is not part of the tree!\n";
    return;
  }
  Nodes.erase(it);
  Nodes.insert(Nodes.begin(), node);
}

void Expression::add_node(ExpressionNode *node) {

  if (std::find(Nodes.begin(), Nodes.end(), node) == Nodes.end()) {

    Nodes.push_back(node);
    value_node_map.insert(std::make_pair(node->V, node));
  }
}

/// @return null if value not already known, the node for v otherwise
ExpressionNode *Expression::getNodeFor(Value *v) {

  auto it = value_node_map.find(v);

  if (it != value_node_map.end())
    return (*it).second;
  return nullptr;
}

ExpressionNode *Expression::deserialize_rec(BasicBlock *BB, Expression *T, json &curr, json &G, ScalarEvolution *SE,
                                            std::map<u_int64_t, ExpressionNode *> &lazy_references) {

  static std::map<unsigned, ExpressionNode *> id_node_map;

  json edges = G[1]["edges"];
  json nodes = G[0]["nodes"];
  unsigned _id = curr["_id"].as_uint();

  auto it = id_node_map.find(_id);
  // Node has already been created
  if (it != id_node_map.end()) {
    return (*it).second;
  }

  SmallVector<ExpressionNode *, 4> operands;
  SmallVector<json, 4> successors;

  for (auto it = edges.begin_elements(); it != edges.end_elements(); ++it) {
    unsigned src_id = (*it)["src"].as_uint();
    unsigned dst_id = (*it)["dst"].as_uint();
    if (_id == src_id) {

      auto it_node = std::find_if(nodes.begin_elements(), nodes.end_elements(),
                                  [&dst_id](json &node) { return node["_id"].as_uint() == dst_id; });
      if (it_node != nodes.end_elements())
        successors.push_back(*it_node);
    }
  }

  for (json obj : successors)
    if (ExpressionNode *op = deserialize_rec(BB, T, obj, G, SE, lazy_references))
      operands.push_back(op);

  json attributes = curr["attributes"];

  Value *v = nullptr;

  InductionDescription *idesc = nullptr;

  if (!attributes.is_empty()) {

    IRBuilder<> builder(BB);
    Type *ty = nullptr;
    if (attributes.has_member("type")) {
      std::string typestr = attributes["type"].as_string();
      ty = type_from_str(BB->getContext(), typestr);
    }
    if (!ty) {
      errs() << "Could not determine type of expression!\n";
      return nullptr;
    }

    if (attributes.has_member("opcode")) {

      json opcode = attributes["opcode"];
      unsigned code = opcode[1].as_uint();

      if (Instruction::isBinaryOp(code)) {
        if (operands.size() == 2)
          v = builder.CreateBinOp(static_cast<Instruction::BinaryOps>(code), operands[0]->getValue(),
                                  operands[1]->getValue());

      } else if (Instruction::isCast(code)) {
        if (operands.size() == 1)
          v = builder.CreateCast(static_cast<Instruction::CastOps>(code), operands[0]->getValue(), ty);

      } else {

        switch (code) {
        case Instruction::Store: {
          if (operands.size() == 2)
            v = builder.CreateStore(operands[0]->getValue(), operands[1]->getValue());
          break;
        }
        case Instruction::Alloca: {
          v = builder.CreateAlloca(ty);
          break;
        }
        case Instruction::Load: {
          if (operands.size() == 1)
            v = builder.CreateLoad(operands[0]->getValue());
          break;
        }
        case Instruction::PHI: {
          if (attributes.has_member("i_val")) {
            json ival = attributes["i_val"];

            const SCEV *SEStart = SE->getConstant(ty, ival[0].as_long(), true);
            const SCEVConstant *SEStep = dyn_cast<SCEVConstant>(SE->getConstant(ty, ival[1].as_long(), true));
            const SCEV *SEExit = nullptr;

            if (ival[2].is_string()) {

              // normalize exit expression (remove %, trim, ...)
              std::string e = ival[2].as_string();
              std::replace(e.begin(), e.end(), '%', ' ');
              size_t pos = e.find_first_not_of(" \t");
              if (std::string::npos != pos)
                e = e.substr(pos);

              ValueSymbolTable &SymTable = BB->getParent()->getValueSymbolTable();
              Value *v = SymTable.lookup(e);
              SEExit = SE->getUnknown(v);
            } else if (ival[2].is_numeric()) {

              SEExit = SE->getConstant(ty, ival[2].as_long(), true);
            }

            idesc = new InductionDescription(SEStart, SEStep, SEExit);
          }
          v = builder.CreatePHI(ty, 0);
          break;
        }

        case Instruction::GetElementPtr: {
          SmallVector<Value *, 8> idxList;
          std::for_each(operands.begin() + 1, operands.end(),
                        [&idxList](ExpressionNode *node) { idxList.push_back(node->getValue()); });
          Value *ptr = operands[0]->getValue();

          v = builder.CreateGEP(operands[0]->getValue(), idxList);
          break;
        }
        case Instruction::ICmp: {
          if (operands.size() == 2) {
            CmpInst::Predicate P = static_cast<CmpInst::Predicate>(opcode[2].as_uint());
            v = builder.CreateICmp(P, operands[0]->getValue(), operands[1]->getValue());
          }
          break;
        }
        case Instruction::FCmp: {
          if (operands.size() == 2) {
            CmpInst::Predicate P = static_cast<CmpInst::Predicate>(opcode[2].as_uint());
            v = builder.CreateFCmp(P, operands[0]->getValue(), operands[1]->getValue());
          }
          break;
        }
        case Instruction::Select: {
          if (operands.size() == 3) {
            v = builder.CreateSelect(operands[0]->getValue(), operands[1]->getValue(), operands[2]->getValue());
          }
          break;
        }
        default:
          errs() << "Don't know how to deseralize instruction [" << Instruction::getOpcodeName(code) << "," << code
                 << "]\n";
        }
      }
    }

    if (attributes.has_member("argument")) {
      ValueSymbolTable &SymTable = BB->getParent()->getValueSymbolTable();
      std::string argname = attributes["argument"].as_string();
      v = SymTable.lookup(argname);
      if (!v)
        errs() << "Unknown argument\n";
    }

    if (attributes.has_member("constant")) {
      if (ty->isIntegerTy())
        v = ConstantInt::get(ty, attributes["constant"].as_longlong(), true);
      else if (ty->isFloatingPointTy())
        v = ConstantFP::get(ty, attributes["constant"].as_double());
    }

    if (!v) {
      errs() << "Could not create expression pattern!\n";
      return nullptr;
    }
  }
  ExpressionNode *N;
  if (idesc->valid())
    N = new ExpressionNode(T, v, idesc);
  else
    N = new ExpressionNode(T, v);

  if (!N)
    return nullptr;

  if (attributes.has_member("ref"))
    lazy_references.insert(std::make_pair(attributes["ref"].as_ulong(), N));

  N->_internal_id = _id;

  id_node_map.insert(std::make_pair(_id, N));

  for (auto op : operands)
    N->add_child(op);
  T->add_node(N);
  return N;
}

static bool parse_pointer_type(LLVMContext &context, Type *&base, Type *&Result, std::string &str) {

  if (str.empty() && Result)
    return true;

  std::string token = str.substr(0, 1);
  str = str.substr(1);

  Type *ty;
  if (token[0] == '*') {
    parse_pointer_type(context, base, ty, str);
  }

  return false;
}

// Consume the specified token
// interted logic!
static bool parse_token(char e, std::string &str) {

  if (str.empty())
    return true;
  std::string token = str.substr(0, 1);
  str = str.substr(1);

  if (token[0] == e)
    return false;

  return true;
}

static bool parse_arraytype(LLVMContext &context, Type *&Result, std::string &str) {

  std::string token = str.substr(0, 1);
  str = str.substr(1);

  std::string number_str;
  // Consume number
  if (isdigit(token[0])) {

    number_str = token[0];
    while (!str.empty() && isdigit(str[0])) {
      token = str.substr(0, 1);
      str = str.substr(1);
      number_str += token[0];
    }

  } else {
    errs() << "Expected number, got " << token << "\n";
    return false;
  }

  Regex regex_digits("[0-9]+");
  SmallVector<StringRef, 8> regexmatch;

  uint64_t Size;
  // Lex (0-9)+
  if (regex_digits.match(number_str, &regexmatch))
    Size = std::stoi(regexmatch[0]);
  else
    errs() << "Expected a number, got" << token << "\n";
  // Consume potential whitespaces
  while (isspace(str[0]))
    str = str.substr(1);

  // Consume 'x'
  if (parse_token('x', str)) {
    errs() << "Unexpected end of array type, 'x' expected.\n";
    return false;
  }

  while (isspace(str[0]))
    str = str.substr(1);

  // Consume ... x TYPE, tokens will be consumed from remaining string
  Type *ty = Expression::type_from_str(context, str);

  if (parse_token(']', str)) {
    errs() << "Unexpected end of array type, ']' expected.\n";
    return false;
  }
  Result = ArrayType::get(ty, Size);
  return true;
}

// Returns an immutable type object from string
// i8...i64, i8*...i64*, i8**...i32**
// float, double
// array types: [n x (int|float|double)]
Type *Expression::type_from_str(LLVMContext &context, std::string &str) {

  Type *ty;

  if (str.empty())
    return nullptr;

  auto _str = [](Type * type)->std::string {
    std::string type_str;
    raw_string_ostream rso(type_str);
    type->print(rso);
    return rso.str();
  };

  static std::map<std::string, Type *> str_type_map = {
    { _str(Type::getFloatTy(context)), Type::getFloatTy(context) },
    { _str(Type::getFloatPtrTy(context)), Type::getFloatPtrTy(context) },
    { _str(Type::getVoidTy(context)), Type::getVoidTy(context) },
    { _str(Type::getDoubleTy(context)), Type::getDoubleTy(context) },
    { _str(Type::getInt1Ty(context)), Type::getInt1Ty(context) },
    { _str(Type::getInt8Ty(context)), Type::getInt8Ty(context) },
    { _str(Type::getInt16Ty(context)), Type::getInt16Ty(context) },
    { _str(Type::getInt32Ty(context)), Type::getInt32Ty(context) },
    { _str(Type::getInt64Ty(context)), Type::getInt64Ty(context) }
  };
  // consume primitive type

  char token = (str.substr(0, 1))[0];
  str = str.substr(1);

  switch (token) {
  case 'i':
  case 'v':
  case 'f':
  case 'd': { // match iX, float, double, void

    std::string typestr;
    typestr += token;
    while (!str.empty() && isalnum(str[0])) {
      typestr += str.substr(0, 1);
      str = str.substr(1);
    }
    if (!typestr.empty() && str_type_map.find(typestr) != str_type_map.end())
      ty = str_type_map[typestr];

    break;
  }
  case '[': {
    if (!parse_arraytype(context, ty, str))
      return nullptr;

    break;
  }
  default:
    errs() << "Unexpected " << token << "! Expected one of '[', 'int', 'float', 'double'.\n";
    return nullptr;
  }

  // parse suffix
  while (!str.empty() && str[0] == '*') {
    str = str.substr(1);
    ty = PointerType::getUnqual(ty);
  }

  return ty;
}

Expression *Expression::deserialize(BasicBlock *BB, json &obj, ScalarEvolution *SE,
                                    std::map<u_int64_t, ExpressionNode *> &lazyReferences) {
  Expression *T = new Expression(true);

  json graph = obj["graph"];

  // iterate nodes
  json nodes = graph[0]["nodes"];

  for (auto it = nodes.begin_elements(), end = nodes.end_elements(); it != end; ++it) {
    json attributes = (*it)["attributes"];

    Value *v = nullptr;

    if (!attributes.is_empty()) {

      Type *ty = nullptr;
      if (attributes.has_member("type")) {
        std::string typestr = attributes["type"].as_string();
        ty = type_from_str(BB->getContext(), typestr);
      }
      if (attributes.has_member("argument")) {
        ValueSymbolTable &SymTable = BB->getParent()->getValueSymbolTable();
        std::string argname = attributes["argument"].as_string();
        v = SymTable.lookup(argname);

        v = (v == nullptr) ? new Argument(ty, argname, BB->getParent()) : v;
      }
    }
  }

  ExpressionNode *root = deserialize_rec(BB, T, nodes[0], graph, SE, lazyReferences);
  T->setRoot(root);
  return T;
}

Expression *Expression::calculateBranchExpression(TerminatorInst *term, ScalarEvolution *SE, LoopInfo *LI) {
  if (BranchInst *branch = dyn_cast<BranchInst>(term)) {
    CmpInst *cmp = dyn_cast<CmpInst>(branch->getOperand(0)); // get comparison
    if (cmp)
      return calculateExpression(cmp, SE, LI);
  }

  return nullptr;
}

namespace optmig {

/// getLoopPhiForCounter - Return the loop header phi IFF IncV adds a loop
/// invariant value to the phi.
static PHINode *getLoopPhiForCounter(Value *IncV, Loop *L) {
  Instruction *IncI = dyn_cast<Instruction>(IncV);
  if (!IncI)
    return nullptr;

  switch (IncI->getOpcode()) {
  case Instruction::Add:
  case Instruction::Sub:
    break;
  case Instruction::GetElementPtr:
    // An IV counter must preserve its type.
    if (IncI->getNumOperands() == 2)
      break; // dont return nullptr
  default:
    return nullptr;
  }

  PHINode *Phi = dyn_cast<PHINode>(IncI->getOperand(0));
  if (Phi && Phi->getParent() == L->getHeader()) {
    if (L->isLoopInvariant(IncI->getOperand(1)))
      return Phi;
    return nullptr;
  }
  if (IncI->getOpcode() == Instruction::GetElementPtr)
    return nullptr;

  // Allow add/sub to be commuted.
  Phi = dyn_cast<PHINode>(IncI->getOperand(1));
  if (Phi && Phi->getParent() == L->getHeader()) {
    if (L->isLoopInvariant(IncI->getOperand(0)))
      return Phi;
  }
  return nullptr;
}

static InductionDescription *FindPotentialInduction(PHINode *phi, LoopInfo *LI, ScalarEvolution *SE) {
  Loop *L = LI->getLoopFor(phi->getParent());

  if (!L)
    return nullptr;
  const SCEV *BECount = SE->getBackedgeTakenCount(L);
  if(BECount->getSCEVType() == SCEVTypes::scCouldNotCompute)
	  return nullptr;
  uint64_t BCWidth = SE->getTypeSizeInBits(BECount->getType());

  assert(L->isLoopSimplifyForm() && "Loop is not in simplified form");

  BasicBlock *Latch = L->getLoopLatch();

  if (!SE->isSCEVable(phi->getType()))
    return nullptr;

  if (BECount->getType()->isPointerTy() && !phi->getType()->isPointerTy())
    return nullptr;

  const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(SE->getSCEV(phi));
  if (!AR || AR->getLoop() != L || !AR->isAffine())
    return nullptr;

  uint64_t PhiWidth = SE->getTypeSizeInBits(AR->getType());

  // Avoid comparing an integer IV against a pointer Limit.
  if (PhiWidth < BCWidth)
    return nullptr;

  const SCEVConstant *Step = dyn_cast<SCEVConstant>(AR->getStepRecurrence(*SE));
  if (!Step || !Step->isOne())
    return nullptr;

  int LatchIdx = phi->getBasicBlockIndex(Latch);
  Value *IncV = phi->getIncomingValue(LatchIdx);

  if (getLoopPhiForCounter(IncV, L) != phi)
    return nullptr;

  const SCEV *Init = AR->getStart();

  // Canonicalize loop bound
  // exit is one less than the actual trip count --> add one
  const SCEV *Bound = SE->getAddExpr(BECount, SE->getConstant(BECount->getType(), 1, false));

  if (Init && Step && Bound)
    return new InductionDescription(Init, Step, Bound);

  return nullptr;
}
}
Expression *Expression::calculateAssignmentExpression(StoreInst *store, ScalarEvolution *SE, LoopInfo *LI) {
  return calculateExpression(store, SE, LI);
}

std::vector<Expression *> Expression::calculateExpressions(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI) {

  std::vector<Expression *> result;

  // Calculate assignment expression
  for (auto bb = BB->begin(), be = BB->end(); bb != be; ++bb) {

    Instruction *inst = &*bb;

    Expression *E = nullptr;

    // Check if instruction is possible left hand side of
    if (StoreInst *store = dyn_cast<StoreInst>(inst)) {
      E = calculateAssignmentExpression(store, SE, LI);
    } else if (TerminatorInst *term = dyn_cast<TerminatorInst>(inst)) {
      E = calculateBranchExpression(term, SE, LI);
    } else if (PHINode *phi = dyn_cast<PHINode>(inst)) {
      E = calculateExpression(phi, SE, LI);

      if(!E)
    	  continue;
      ExpressionNode *node = E->getNodeFor(phi);

      const InductionDescription *desc = node->getInductionDescription();
      if (!desc) {
        delete E;
        E = nullptr;
      }
    }

    if (E)
      result.push_back(E);
  }

  return result;
}

Expression *Expression::calculateExpression(Instruction *inst, ScalarEvolution *SE, LoopInfo *LI) {

  Expression *T = new Expression();

  SmallVector<std::pair<Value *, ExpressionNode *>, 8> stack;
  stack.push_back(std::make_pair(inst, nullptr));
  SmallPtrSet<Value *, 16> visisted;
  while (!stack.empty()) {

    auto stack_val = stack.pop_back_val();
    Value *val = stack_val.first;
    ExpressionNode *CurNode = stack_val.second;

    if (!visisted.insert(val).second)
      continue;

    ExpressionNode *node = T->getNodeFor(val);
    if (node && CurNode != nullptr) {
      CurNode->add_child(CurNode->begin(), node);
      continue;
    }

    if (isa<Instruction>(val)) {

      Instruction *instr = cast<Instruction>(val);

      if (PHINode *phi = dyn_cast<PHINode>(instr)) {
        InductionDescription *idesc = FindPotentialInduction(phi, LI, SE);
        node = new ExpressionNode(T, phi, idesc);
        if (idesc) {

          // resolve all unknown values
          SmallVector<Value *, 8> unknowns;
          SCEVTraversalCollectUnknows visitor(SE, unknowns);
          visitAll(idesc->getInit(), visitor);
          visitAll(idesc->getExit(), visitor);

          for (Value *v : unknowns) {
            ExpressionNode *n = new ExpressionNode(node->Parent, v);
            node->Parent->add_node(n);
            node->add_child(n);
          }
        }
      } else if (isa<CallInst>(instr)) {
        errs() << "Call functions not supported, please inline first!\n";
        delete T;
        return nullptr;
      } else {
        node = new ExpressionNode(T, val);
      }

      if (!node->isInductionValue()) // do not consider already visited nodes
        for (Use &U : instr->operands()) {
          Value *operand = U.get();
          stack.push_back(std::make_pair(operand, node)); // visit each operand
        }
    } else {

      node = new ExpressionNode(T, val);
    }

    if (node != nullptr) {
      T->add_node(node);
      if (CurNode != nullptr)
        CurNode->add_child(CurNode->begin(), node);
    }
  }

  return T;
}

std::string JSONGraphTraits<const Expression *>::getNodeAttributes(const ExpressionNode &N, const Expression &E) {
  Value *v = N.getValue();

  const ExpressionNode *Root = E.getRoot();
  Value *root_inst = Root->getValue();

  std::string str;
  raw_string_ostream O(str);
  O << "{ ";
  {
    if (Argument *arg = dyn_cast<Argument>(v)) {
      O << "\"argument\" : ";
      O << "\"" << arg->getName() << "\"";

      O << ", ";
      O << "\"type\" : ";
      O << "\"" << *v->getType() << "\"";

    } else if (Constant *_const = dyn_cast<Constant>(v)) {

      O << "\"constant\" : ";
      if (ConstantInt *int_const = dyn_cast<ConstantInt>(_const)) {
        O << int_const->getValue().getSExtValue();
      } else if (ConstantFP *fp_const = dyn_cast<ConstantFP>(_const)) {
        const APFloat &fpval = fp_const->getValueAPF();
        Type *ty = fp_const->getType();
        if (ty->isFloatTy()) {
          O << fpval.convertToFloat();
        } else if (ty->isDoubleTy()) {
          O << fpval.convertToDouble();
        } else {
          errs() << "Float semantic not supported: " << *ty << "\n";
          return "";
        }
      }

      O << ", ";
      O << "\"type\" : ";
      O << "\"" << *v->getType() << "\"";

    } else if (Instruction *inst = dyn_cast<Instruction>(v)) {
      unsigned opcode = inst->getOpcode();
      O << "\"opcode\" : "
        << "[\"" << Instruction::getOpcodeName(opcode) << "\"," << opcode;

      switch (opcode) {
      case Instruction::ICmp: {

        ICmpInst *cmp = cast<ICmpInst>(inst);
        O << ", ";
        O << cmp->getPredicate();
        break;
      }
      case Instruction::FCmp: {
        FCmpInst *cmp = cast<FCmpInst>(inst);
        O << ", ";
        O << cmp->getPredicate();
        break;
      }
      }

      O << "]";
      // Add reference for instructions that were defined in another
      // BB. These are usually phi nodes.
      // In some cases instructions were moved by licm, thus deriving
      // a reference too
      if (Instruction *user = dyn_cast<Instruction>(root_inst))
        if (inst->getParent() != user->getParent()) {
          O << ", ";
          O << "\"ref\":" << E.get_parent()->get_parent()->get_node(inst->getParent())->get_uid();
        }

      O << ", ";
      O << "\"type\" : ";
      if (AllocaInst *alloca = dyn_cast<AllocaInst>(inst)) {
        O << "\"" << *alloca->getAllocatedType() << "\"";
      } else {
        O << "\"" << *v->getType() << "\"";
      }
    }

    if (N.isInductionValue()) {
      const InductionDescription *idesc = N.getInductionDescription();
      const SCEVConstant *init = dyn_cast<SCEVConstant>(idesc->getInit());
      const SCEVConstant *step = dyn_cast<SCEVConstant>(idesc->getStep());
      const SCEV *exit = idesc->getExit();

      O << ", ";
      O << "\"i_val\" : "
        << "[ " << init->getValue()->getSExtValue() << ", " << step->getValue()->getSExtValue() << ",";
      if (exit->getSCEVType() == SCEVTypes::scConstant) { // constant exit value
        const SCEVConstant *exitval = dyn_cast<SCEVConstant>(exit);
        O << exitval->getValue()->getSExtValue(); // exit value depends on argument
      } else if (exit->getSCEVType() == SCEVTypes::scUnknown) {
        O << "\"" << *exit << "\"";
      }
      O << "]";
    }
  }
  O << "} ";
  return O.str();
}
