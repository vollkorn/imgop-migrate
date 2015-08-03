/*
 * Expression.cpp
 *
 *  Created on: Jul 28, 2015
 *      Author: lukas
 */

#include "Expression.h"

#include "llvm/IR/Module.h"

#include "llvm/Analysis/ScalarEvolution.h"

#include "AbstractCFG.h"

using namespace llvm;
using optmig::Expression;
using optmig::ExpressionNode;

void ExpressionNode::print(raw_ostream &O, bool simple) const {

  O << getLabel() << "\n";
  if (!simple)
    O << *V << "\n";

  if (isInductionValue()) {
    ival.print(O);
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

  if (Instruction *inst_1 = dyn_cast<Instruction>(v1))
    if (Instruction *inst_2 = dyn_cast<Instruction>(v2))
      if (inst_1->getOpcode() == inst_2->getOpcode())
        return true;

  if (ConstantInt *int_const1 = dyn_cast<ConstantInt>(v1))
    if (ConstantInt *int_const2 = dyn_cast<ConstantInt>(v2))
      return true;

  if (ConstantFP *fp_const1 = dyn_cast<ConstantFP>(v1))
    if (ConstantFP *fp_const2 = dyn_cast<ConstantFP>(v2))
      return true;

  if (Argument *arg_1 = dyn_cast<Argument>(v1))
    if (Argument *arg_2 = dyn_cast<Argument>(v2))
      return true;

  return false;
}

void Expression::delete_recursive(ExpressionNode *node) {

  std::vector<ExpressionNode *> children = node->Children;
  if (User *U = dyn_cast<User>(node->getValue()))
    U->dropAllReferences();
  delete node;
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

ExpressionNode *Expression::deserialize_rec(BasicBlock *BB, Expression *T, json &curr, json &G, ScalarEvolution *SE) {

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
    if (ExpressionNode *op = deserialize_rec(BB, T, obj, G, SE))
      operands.push_back(op);

  json attributes = curr["attributes"];

  Value *v = nullptr;

  if (!attributes.is_empty()) {

    IRBuilder<> builder(BB);
    Type *ty = nullptr;
    if (attributes.has_member("type"))
      ty = getTypeFromString(BB->getContext(), attributes["type"].as_string());

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

            std::string e = ival[2].as_string();
            std::replace(e.begin(), e.end(), '%', ' ');
            size_t pos = e.find_first_not_of(" ");
            if (std::string::npos != pos)
              e = e.substr(pos);

            ValueSymbolTable &SymTable = BB->getParent()->getValueSymbolTable();
            Value *v = SymTable.lookup(e);
            const SCEV *SEExit = SE->getUnknown(v);

            InductionDescription idesc(SEStart, SEStep, SEExit);
          }
          v = builder.CreatePHI(ty, 0);
          break;
        }

        case Instruction::GetElementPtr: {
          SmallVector<Value *, 8> idxList;
          std::for_each(operands.begin() + 1, operands.end(),
                        [&idxList](ExpressionNode *node) { idxList.push_back(node->getValue()); });
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
        }
      }
    }

    if (attributes.has_member("argument")) {
      ValueSymbolTable &SymTable = BB->getParent()->getValueSymbolTable();
      std::string argname  = attributes["argument"].as_string();
      v = SymTable.lookup(argname);

      v = (v == nullptr) ? new Argument(ty, argname) : v;
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
  ExpressionNode *N = new ExpressionNode(T, v);

  N->_internal_id = _id;

  id_node_map.insert(std::make_pair(_id, N));

  for (auto op : operands)
    N->add_child(op);
  T->add_node(N);
  return N;
}

Type *Expression::getTypeFromString(LLVMContext &context, const std::string &str) {
  if (str.empty())
    return nullptr;
  auto _str = [](Type * type)->std::string {
    std::string type_str;
    raw_string_ostream rso(type_str);
    type->print(rso);
    return rso.str();
  };

  LLVMContext &c = context;
  static std::map<std::string, Type *> str_type_map = { { _str(Type::getFloatTy(c)), Type::getFloatTy(c) },
                                                        { _str(Type::getFloatPtrTy(c)), Type::getFloatPtrTy(c) },
                                                        { _str(Type::getVoidTy(c)), Type::getVoidTy(c) },
                                                        { _str(Type::getDoubleTy(c)), Type::getDoubleTy(c) },
                                                        { _str(Type::getInt1Ty(c)), Type::getInt1Ty(c) },
                                                        { _str(Type::getInt8Ty(c)), Type::getInt8Ty(c) },
                                                        { _str(Type::getInt16Ty(c)), Type::getInt16Ty(c) },
                                                        { _str(Type::getInt32Ty(c)), Type::getInt32Ty(c) },
                                                        { _str(Type::getInt64Ty(c)), Type::getInt64Ty(c) } };

  if (str_type_map.find(str) != str_type_map.end())
    return str_type_map[str];
  return nullptr;
}

Expression *Expression::deserialize(BasicBlock *BB, json &obj, ScalarEvolution *SE) {
  Expression *T = new Expression(true);

  json graph = obj["graph"];

  // iterate nodes
  json nodes = graph[0]["nodes"];

  ExpressionNode *root = deserialize_rec(BB, T, nodes[0], graph, SE);
  T->setRoot(root);
  return T;
}

Expression *Expression::calculateBranchExpression(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI) {
  TerminatorInst *term = BB->getTerminator();

  if (BranchInst *branch = dyn_cast<BranchInst>(term)) {

    if (branch->getNumSuccessors() < 2)
      return nullptr;

    CmpInst *cmp = dyn_cast<CmpInst>(branch->getOperand(0)); // get comparision

    return calculateExpression(BB, cmp, SE, LI);

  } else {
    errs() << "Cannot compute branch expression from non branch instrucion" << *term << "\n";
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

static InductionDescription FindPotentialInduction(PHINode *phi, LoopInfo *LI, ScalarEvolution *SE) {

  Loop *L = LI->getLoopFor(phi->getParent());

  if (!L)
    return {};

  const SCEV *BECount = SE->getBackedgeTakenCount(L);
  uint64_t BCWidth = SE->getTypeSizeInBits(BECount->getType());

  assert(L->isLoopSimplifyForm() && "Loop is not in simplified form");

  BasicBlock *Latch = L->getLoopLatch();

  if (!SE->isSCEVable(phi->getType()))
    return {};

  if (BECount->getType()->isPointerTy() && !phi->getType()->isPointerTy())
    return {};

  const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(SE->getSCEV(phi));
  if (!AR || AR->getLoop() != L || !AR->isAffine())
    return {};

  uint64_t PhiWidth = SE->getTypeSizeInBits(AR->getType());

  // Avoid comparing an integer IV against a pointer Limit.
  if (PhiWidth < BCWidth || !L->getHeader()->getParent()->getParent()->getDataLayout()->isLegalInteger(PhiWidth))
    return {};

  const SCEVConstant *Step = dyn_cast<SCEVConstant>(AR->getStepRecurrence(*SE));
  if (!Step || !Step->isOne())
    return {};
  ;

  int LatchIdx = phi->getBasicBlockIndex(Latch);
  Value *IncV = phi->getIncomingValue(LatchIdx);

  if (getLoopPhiForCounter(IncV, L) != phi)
    return {};

  const SCEV *Init = AR->getStart();

  // Canonicalize loop bound
  // exit is one less than the actual trip count --> add one
  const SCEV *Bound = SE->getAddExpr(BECount, SE->getConstant(BECount->getType(), 1, false));

  if (Init && Step && Bound)
    return { Init, Step, Bound };

  return {};
}
}
Expression *Expression::calculateAssignmentExpression(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI) {
  StoreInst *store = nullptr;

  // Calculate assignment expression
  for (auto bb = BB->begin(), be = BB->end(); bb != be; ++bb) {

    Instruction *inst = &*bb;

    // Check if instruction is possible left hand side of
    if (isa<StoreInst>(inst))
      store = cast<StoreInst>(inst);
  }

  if (!store)
    return nullptr;

  return calculateExpression(BB, store, SE, LI);
}

Expression *Expression::calculateExpression(BasicBlock *BB, Instruction *inst, ScalarEvolution *SE, LoopInfo *LI) {

  Expression *T = new Expression();

  SmallVector<std::pair<Value *, ExpressionNode *>, 8> stack;
  stack.push_back(std::make_pair(inst, nullptr));

  while (!stack.empty()) {

    auto stack_val = stack.pop_back_val();
    Value *val = stack_val.first;
    ExpressionNode *CurNode = stack_val.second;

    ExpressionNode *node = T->getNodeFor(val);
    if (node && CurNode != nullptr) {
      CurNode->add_child(CurNode->begin(), node);
      continue;
    }

    if (isa<Instruction>(val)) {

      Instruction *instr = cast<Instruction>(val);

      if (PHINode *phi = dyn_cast<PHINode>(instr)) {

        Loop *L = LI->getLoopFor(phi->getParent());

        InductionDescription idesc = FindPotentialInduction(phi, LI, SE);
        if (idesc.valid())
          node = new ExpressionNode(T, phi, idesc);
        else
          node = new ExpressionNode(T, phi);

      } else if (isa<CallInst>(instr)) {
        errs() << "Call functions not supported, please inline first!\n";
        delete T;
        return nullptr;
      } else {
        node = new ExpressionNode(T, val);
      }

      if (!node->isInductionValue())
        for (Use &U : instr->operands()) {
          Value *operand = U.get();
          stack.push_back(std::make_pair(operand, node)); // visit each operand
        }
    } else if (isa<Constant>(val)) {

      Constant *_const = dyn_cast<Constant>(val);

      node = new ExpressionNode(T, _const);
    } else if (isa<Argument>(val)) {

      Argument *arg = dyn_cast<Argument>(val);

      node = new ExpressionNode(T, arg);
    }

    if (nullptr != node) {
      T->add_node(node);
      if (CurNode != nullptr)
        CurNode->add_child(CurNode->begin(), node);
    }
  }

  return T;
}
