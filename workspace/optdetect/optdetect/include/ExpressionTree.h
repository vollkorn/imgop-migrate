/*
 * ExpressionTree.h
 *
 *  Created on: Jul 9, 2015
 *      Author: lukas
 */

#ifndef EXPRESSIONTREE_H_
#define EXPRESSIONTREE_H_

#include "llvm/IR/Value.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.def"

#include "llvm/ADT/GraphTraits.h"

#include "llvm/Support/raw_ostream.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"

#include "JSONGraphWriter.h"

#include <set>

using namespace llvm;

namespace {
struct InductionDescription {

private:
  const SCEV *Start = nullptr;
  const SCEVConstant *Step = nullptr;
  const SCEV *End = nullptr;

public:
  InductionDescription() {}

  InductionDescription(const SCEV *Start, const SCEVConstant *Step, const SCEV *End) {
    this->Start = Start;
    this->Step = Step;
    this->End = End;
  }

  const SCEV *getInit() { return Start; }
  const SCEVConstant *getStep() { return Step; }
  const SCEV *getEnd() { return End; }

  bool valid() const { return Start != nullptr && Step != nullptr && End != nullptr; }

  void print(raw_ostream &O) const { O << "(" << *Start << ", " << *Step << ", " << *End << ")"; }
};
}

namespace {

struct ExpressionTreeNode {

  friend class ExpressionTree;

private:
  std::map<unsigned, std::string> opcode_symbol = { { Instruction::Add, "+" },
                                                    { Instruction::FAdd, "+" },
                                                    { Instruction::Mul, "*" },
                                                    { Instruction::FMul, "*" },
                                                    { Instruction::SDiv, "/" },
                                                    { Instruction::FDiv, "/" },
                                                    { Instruction::UDiv, "/" },
                                                    { Instruction::And, "&" },
                                                    { Instruction::Or, "|" },
                                                    { Instruction::Xor, "^" },
                                                    { Instruction::Shl, "<<" },
                                                    { Instruction::LShr, ">>" },
                                                    { Instruction::Store, "store" },
                                                    { Instruction::Load, "load" },
                                                    { Instruction::ICmp, "cmp" } };

public:
  typedef std::vector<ExpressionTreeNode *>::iterator iterator;
  typedef std::vector<ExpressionTreeNode *>::const_iterator const_iterator;

  inline iterator begin() { return Children.begin(); }
  inline iterator end() { return Children.end(); }

  inline const_iterator begin() const { return Children.begin(); }
  inline const_iterator end() const { return Children.end(); }

  void add_child(ExpressionTreeNode *node) { Children.push_back(node); }

  void add_child(iterator it, ExpressionTreeNode *node) { Children.insert(it, node); }

  std::string getLabel() const {
    if (Instruction *inst = dyn_cast<Instruction>(V))
      return std::string(Instruction::getOpcodeName(inst->getOpcode()));
    else if (Argument *arg = dyn_cast<Argument>(V))
      return "arg";
    else if (Constant *_const = dyn_cast<Constant>(V))
      return "const";

    return "";
  }

  Value *getValue() const { return V; }

  void print(raw_ostream &O, bool simple = true) const {

    O << getLabel() << "\n";
    if (!simple)
      O << *V << "\n";

    if (isInductionValue()) {
      ival.print(O);
    }
  }

  InductionDescription getInductionDescription() const { return ival; }

  ExpressionTreeNode(Value *V) : V(V) {}

  ExpressionTreeNode(Value *V, InductionDescription IV) : ExpressionTreeNode(V) { ival = IV; }

  bool isInductionValue() const { return ival.valid(); }

  bool isInstanceOf(unsigned opcode) const {
    if (Instruction *inst = dyn_cast<Instruction>(V))
      return inst->getOpcode() == opcode;
    return false;
  }

private:
  Value *V;

  InductionDescription ival;

  std::vector<ExpressionTreeNode *> Children;
};
}

namespace {

class ExpressionTree {

  friend class ExpressionTreeNode;

public:
  virtual ~ExpressionTree() {}

  typedef std::vector<ExpressionTreeNode *>::iterator iterator;
  typedef std::vector<ExpressionTreeNode *>::const_iterator const_iterator;

  inline iterator nodes_begin() { return Nodes.begin(); }
  inline iterator nodes_end() { return Nodes.end(); }

  inline const_iterator nodes_begin() const { return Nodes.begin(); }
  inline const_iterator nodes_end() const { return Nodes.end(); }

  ExpressionTreeNode *getRoot() const { return *(nodes_begin()); }

  void setRoot(ExpressionTreeNode *node) {

    auto it = std::find_if(Nodes.begin(), Nodes.end(), [&node](ExpressionTreeNode *n) { return n == node; });

    if(it == Nodes.end()){
    	errs () << "Cannot set root node which is not part of the tree!\n";
    	return;
    }

    Nodes.erase(it);
    Nodes.insert(Nodes.begin(), node);
  }

  static ExpressionTree *calculateAssignmentSubtree(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI);

  static ExpressionTree *calculateBranchExpression(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI);

  static const ExpressionTree *deserialize(const std::string &str) {

    json v = json::parse_string(str);
    return deserialize(v);
  }

  static ExpressionTreeNode *deserialize_rec(ExpressionTree *T, json &curr, json &G) {

    json edges = G[1]["edges"];
    json nodes = G[0]["nodes"];
    SmallVector<ExpressionTreeNode *, 4> operands;
    unsigned parent_id = curr["_id"].as_uint();

    SmallVector<json, 4> successors;

    for (auto it = edges.begin_elements(); it != edges.end_elements(); ++it) {
      unsigned src_id = (*it)["src"].as_uint();
      unsigned dst_id = (*it)["dst"].as_uint();
      if (parent_id == src_id) {

        auto it_node = std::find_if(nodes.begin_elements(), nodes.end_elements(),
                                    [&dst_id](json &node) { return node["_id"].as_uint() == dst_id; });
        if (it_node != nodes.end_elements())
          successors.push_back(*it_node);
      }
    }

    for (json obj : successors)
      if (ExpressionTreeNode *op = deserialize_rec(T, obj, G))
        operands.push_back(op);

    json attributes = curr["attributes"];

    Value *v = nullptr;
    if (!attributes.is_empty()) {

      LLVMContext &context = getGlobalContext();
      IRBuilder<> builder(context);
      Type *ty = nullptr;
      if (attributes.has_member("type"))
        ty = getTypeFromString(attributes["type"].as_string());

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
            v = builder.CreatePHI(ty, 2);
            break;
          }

          case Instruction::GetElementPtr: {
            SmallVector<Value *, 8> idxList;
            std::for_each(operands.begin() + 1, operands.end(),
                          [&idxList](ExpressionTreeNode *node) { idxList.push_back(node->getValue()); });
            v = builder.CreateGEP(operands[0]->getValue(), idxList);
            break;
          }
          case Instruction::ICmp: { break; }
          }
        }
      }
      if (attributes.has_member("argument"))
        v = new Argument(ty, attributes["argument"].as_string());

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

    ExpressionTreeNode *N = new ExpressionTreeNode(v);
    for (auto op : operands)
      N->add_child(op);
    T->add_node(N);
    return N;
  }

  static Type *getTypeFromString(const std::string &str) {
    if (str.empty())
      return nullptr;
    auto _str = [](Type * type)->std::string {
      std::string type_str;
      raw_string_ostream rso(type_str);
      type->print(rso);
      return rso.str();
    };

    LLVMContext &ctx = getGlobalContext();

    static std::map<std::string, Type *> str_type_map = { { _str(Type::getFloatTy(ctx)), Type::getFloatTy(ctx) },
                                                          { _str(Type::getFloatPtrTy(ctx)), Type::getFloatPtrTy(ctx) },
                                                          { _str(Type::getVoidTy(ctx)), Type::getVoidTy(ctx) },
                                                          { _str(Type::getDoubleTy(ctx)), Type::getDoubleTy(ctx) },
                                                          { _str(Type::getInt1Ty(ctx)), Type::getInt1Ty(ctx) },
                                                          { _str(Type::getInt8Ty(ctx)), Type::getInt8Ty(ctx) },
                                                          { _str(Type::getInt16Ty(ctx)), Type::getInt16Ty(ctx) },
                                                          { _str(Type::getInt32Ty(ctx)), Type::getInt32Ty(ctx) },
                                                          { _str(Type::getInt64Ty(ctx)), Type::getInt64Ty(ctx) } };

    if (str_type_map.find(str) != str_type_map.end())
      return str_type_map[str];
    return nullptr;
  }

  static const ExpressionTree *deserialize(json &obj) {

    std::map<unsigned, ExpressionTreeNode *> id_node_map;
    ExpressionTree *T = new ExpressionTree();

    json graph = obj["graph"];

    // iterate nodes
    json nodes = graph[0]["nodes"];

    ExpressionTreeNode *root = deserialize_rec(T, nodes[0], graph);
    T->setRoot(root);
    return T;
  }

private:
  void add_node(ExpressionTreeNode *node) { Nodes.push_back(node); }

  static ExpressionTree *calculateExpressionTree(Instruction *inst, ScalarEvolution *SE, LoopInfo *LI);

  ExpressionTree() {}

  std::vector<ExpressionTreeNode *> Nodes;
};
}

//===----------------------------------------------------------------------===//
// GraphTraits specializations for partial expression trees so that they can be treated as
// graphs by the generic graph algorithms.
//

// Provide graph traits for tranversing partial expression trees (graphs) using standard graph
// traversals.
namespace llvm {

template <> struct GraphTraits<ExpressionTreeNode *> {

  typedef ExpressionTreeNode NodeType;
  typedef NodeType::iterator ChildIteratorType;

  static NodeType *getEntryNode(ExpressionTreeNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<const ExpressionTreeNode *> {
  typedef const ExpressionTreeNode NodeType;
  typedef NodeType::const_iterator ChildIteratorType;

  static NodeType *getEntryNode(const ExpressionTreeNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(const NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(const NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<ExpressionTree *> : public GraphTraits<ExpressionTreeNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef ExpressionTree::iterator nodes_iterator;

  static NodeType *getEntryNode(ExpressionTree *expr) { return *(expr->nodes_begin()); }

  static nodes_iterator nodes_begin(ExpressionTree *expr) { return expr->nodes_begin(); }
  static nodes_iterator nodes_end(ExpressionTree *expr) { return expr->nodes_end(); }
};

template <> struct GraphTraits<const ExpressionTree *> : public GraphTraits<ExpressionTreeNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef ExpressionTree::const_iterator nodes_iterator;

  static NodeType *getEntryNode(const ExpressionTree *expr) { return *(expr->nodes_begin()); }

  static nodes_iterator nodes_begin(const ExpressionTree *expr) { return expr->nodes_begin(); }
  static nodes_iterator nodes_end(const ExpressionTree *expr) { return expr->nodes_end(); }
};

template <> struct DOTGraphTraits<const ExpressionTree *> : public DefaultDOTGraphTraits {

  DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

  static std::string getGraphName(const ExpressionTree *T) { return "Expression tree"; }

  std::string getNodeLabel(const ExpressionTreeNode *Node, const ExpressionTree *Graph) {

    std::string lbl;
    raw_string_ostream _strstream(lbl);
    Node->print(_strstream);

    return lbl;
  }
};

} // end namespace llvm

namespace {

template <> struct JSONGraphTraits<const ExpressionTree *> : public DefaultJSONGraphTraits {
  JSONGraphTraits() : DefaultJSONGraphTraits() {}
  static u_int64_t getUniqueNodeID(const ExpressionTreeNode &N) { return (u_int64_t) static_cast<const void *>(&N); }

  static std::string getNodeAttributes(const ExpressionTreeNode &N, const ExpressionTree &) {

    Value *v = N.getValue();

    std::string json_obj;
    raw_string_ostream O(json_obj);
    O << "{ ";
    {
      if (Argument *arg = dyn_cast<Argument>(v)) {
        O << "\"argument\" : ";
        O << "\"" << arg->getName() << "\"";
      } else if (Constant *_const = dyn_cast<Constant>(v)) {
        O << "\"constant\" : ";
        if (ConstantInt *int_const = dyn_cast<ConstantInt>(_const)) {
          O << int_const->getValue().getSExtValue();
        } else if (ConstantFP *fp_const = dyn_cast<ConstantFP>(_const)) {
          O << fp_const->getValueAPF().convertToDouble();
        }
      } else if (Instruction *inst = dyn_cast<Instruction>(v)) {
        unsigned opcode = inst->getOpcode();
        O << "\"opcode\" : "
          << "[\"" << Instruction::getOpcodeName(opcode) << "\"," << opcode << "]";
      }
      O << ", ";
      O << "\"type\" : ";
      O << "\"" << *v->getType() << "\"";

      if (N.isInductionValue()) {
        InductionDescription idesc = N.getInductionDescription();
        O << ", ";
        O << "\"i_val\" : "
          << "[\"" << *idesc.getInit() << "\", \"" << *idesc.getStep() << "\",\"" << *idesc.getEnd() << "\"]";
      }
    }
    O << "} ";
    return json_obj;
  }
};
}

#endif /* EXPRESSIONTREE_H_ */
