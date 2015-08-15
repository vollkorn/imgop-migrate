/*
 * ExpressionTree.h
 *
 *  Created on: Jul 9, 2015
 *      Author: lukas
 */

#ifndef EXPRESSION_H_
#define EXPRESSION_H_

#include "llvm/IR/Value.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.def"
#include "llvm/IR/IRBuilder.h"

#include "llvm/ADT/GraphTraits.h"
#include "llvm/ADT/StringExtras.h"

#include "llvm/IR/ValueSymbolTable.h"

#include "llvm/Support/raw_ostream.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"

#include "JSONGraphWriter.h"

#include <set>
#include <algorithm>
#include <string>

using namespace llvm;

namespace optmig {

struct InductionDescription {

private:
  const SCEV *Start = nullptr;
  const SCEV *Step = nullptr;
  const SCEV *Exit = nullptr;

public:
  enum MapResult {
    IDesc_Map_Ok,
    IDesc_Map_Invalid,
    IDesc_Map_Resolve_Exit
  };

  InductionDescription() {}

  InductionDescription(const SCEV *Start, const SCEV *Step, const SCEV *Exit) {
    this->Start = Start;
    this->Step = Step;
    this->Exit = Exit;
  }

  const SCEV *getInit() { return Start; }
  const SCEV *getStep() { return Step; }
  const SCEV *getExit() { return Exit; }

  bool valid() const { return Start != nullptr && Step != nullptr && Exit != nullptr; }

  void print(raw_ostream &O) const { O << "(" << *Start << ", " << *Step << ", " << *Exit << ")"; }

  MapResult map_to(const InductionDescription &other) const{

    bool match = true;

    match &= (Start == other.Start);
    match &= (Step == other.Step);

    if (!match)
      return IDesc_Map_Invalid;

    if (isa<SCEVConstant>(Exit) && isa<SCEVConstant>(other.Exit))
      if (Exit == other.Exit && match)
        return IDesc_Map_Ok;

    if (match)
      return IDesc_Map_Resolve_Exit;

    return IDesc_Map_Invalid;
  }
};
}

namespace optmig {

struct ExpressionNode;
class AbstractCFG;
class AbstractCFGNode;

class Expression {
  friend class AbstractCFGNode;

private:
  void delete_recursive(ExpressionNode *node);

public:
  virtual ~Expression() { delete_recursive(*nodes_begin()); }

  typedef std::vector<ExpressionNode *>::iterator iterator;
  typedef std::vector<ExpressionNode *>::const_iterator const_iterator;

  inline iterator nodes_begin() { return Nodes.begin(); }
  inline iterator nodes_end() { return Nodes.end(); }

  inline const_iterator nodes_begin() const { return Nodes.begin(); }
  inline const_iterator nodes_end() const { return Nodes.end(); }

  const ExpressionNode *getRoot() const { return *(nodes_begin()); }

  AbstractCFGNode *get_parent() const { return Parent; }

  void setRoot(ExpressionNode *node);

  ExpressionNode *getNodeFor(Value *v);

  static Expression *calculateAssignmentExpression(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI);

  static Expression *calculateBranchExpression(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI);

  static Expression *deserialize(BasicBlock *BB, const std::string &str, ScalarEvolution *SE,
          std::map<u_int64_t, ExpressionNode*> &lazyReferences) {

    json v = json::parse_string(str);
    return deserialize(BB, v, SE, lazyReferences);
  }

  static ExpressionNode *deserialize_rec(BasicBlock *BB, Expression *T, json &curr, json &G, ScalarEvolution *SE, std::map<u_int64_t, ExpressionNode*> &lazy_references);

  static Type *type_from_str(LLVMContext &context, std::string &str);

  static Expression *deserialize(BasicBlock *BB, json &obj, ScalarEvolution *SE, std::map<u_int64_t, ExpressionNode*> &lazyReferences);

private:
  void add_node(ExpressionNode *node);
  void set_parent(AbstractCFGNode *Node) { Parent = Node; }

  static Expression *calculateExpression(BasicBlock *BB, Instruction *inst, ScalarEvolution *SE, LoopInfo *LI);

  std::map<Value *, ExpressionNode *> value_node_map;

  explicit Expression(bool pattern = false) : is_pattern(pattern) {}

  std::vector<ExpressionNode *> Nodes;

  bool is_pattern = false;

  AbstractCFGNode *Parent = nullptr;
};
}

namespace optmig {

struct ExpressionNode {

  friend class Expression;
  friend class AbstractCFG;
public:
  typedef std::vector<ExpressionNode *>::iterator iterator;
  typedef std::vector<ExpressionNode *>::const_iterator const_iterator;

  inline iterator begin() { return Children.begin(); }
  inline iterator end() { return Children.end(); }

  inline const_iterator begin() const { return Children.begin(); }
  inline const_iterator end() const { return Children.end(); }

  void add_child(ExpressionNode *node) { Children.push_back(node); }

  void add_child(iterator it, ExpressionNode *node) { Children.insert(it, node); }

  std::string getLabel() const;

  bool maps_to(const ExpressionNode &other) const ;

  bool maps_to(const ExpressionNode *other) const {
    if (nullptr == other)
      return false;
    else
      return maps_to(*other);
  }

  u_int64_t get_unique_id() const {
    return (!_internal_id) ? (u_int64_t) static_cast<const void *>(this) : _internal_id;
  }

  Value *getValue() const { return V; }

  void print(raw_ostream &O, bool simple = true) const;

  InductionDescription getInductionDescription() const { return ival; }

  ExpressionNode(Expression *Parent, Value *V, AbstractCFGNode *Reference = nullptr)
      : Parent(Parent), V(V), Reference(Reference) {}

  ExpressionNode(Expression *Parent, Value *V, InductionDescription IV, AbstractCFGNode *Reference = nullptr)
      : ExpressionNode(Parent, V, Reference) {
    ival = IV;
  }

  virtual ~ExpressionNode() {}

  bool isInductionValue() const { return ival.valid(); }

  bool isInstanceOf(unsigned opcode) const {
    if (Instruction *inst = dyn_cast<Instruction>(V))
      return inst->getOpcode() == opcode;
    return false;
  }

  AbstractCFGNode* get_reference() const { return Reference; }

private:
  u_int64_t _internal_id = 0;

  Value *V;

  Expression *Parent;

  AbstractCFGNode *Reference;

  InductionDescription ival;

  std::vector<ExpressionNode *> Children;
};
}

//===----------------------------------------------------------------------===//
// GraphTraits specializations for partial expression trees so that they can be treated as
// graphs by the generic graph algorithms.
//

// Provide graph traits for tranversing partial expression trees (graphs) using standard graph
// traversals.
namespace llvm {

using optmig::Expression;
using optmig::ExpressionNode;

template <> struct GraphTraits<ExpressionNode *> {

  typedef ExpressionNode NodeType;
  typedef NodeType::iterator ChildIteratorType;

  static NodeType *getEntryNode(ExpressionNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<const ExpressionNode *> {
  typedef const ExpressionNode NodeType;
  typedef NodeType::const_iterator ChildIteratorType;

  static NodeType *getEntryNode(const ExpressionNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(const NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(const NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<Expression *> : public GraphTraits<ExpressionNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef Expression::iterator nodes_iterator;

  static NodeType *getEntryNode(Expression *expr) { return *(expr->nodes_begin()); }

  static nodes_iterator nodes_begin(Expression *expr) { return expr->nodes_begin(); }
  static nodes_iterator nodes_end(Expression *expr) { return expr->nodes_end(); }
};

template <> struct GraphTraits<const Expression *> : public GraphTraits<ExpressionNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef Expression::const_iterator nodes_iterator;

  static NodeType *getEntryNode(const Expression *expr) { return *(expr->nodes_begin()); }

  static nodes_iterator nodes_begin(const Expression *expr) { return expr->nodes_begin(); }
  static nodes_iterator nodes_end(const Expression *expr) { return expr->nodes_end(); }
};

template <> struct DOTGraphTraits<const Expression *> : public DefaultDOTGraphTraits {

  DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

  static std::string getGraphName(const Expression *T) { return "Expression tree"; }

  std::string getNodeLabel(const ExpressionNode *Node, const Expression *G) {

    std::string lbl;
    raw_string_ostream _strstream(lbl);
    Node->print(_strstream, false);

    return lbl;
  }

  static std::string getEdgeAttributes(const ExpressionNode *N, ExpressionNode::iterator it, const Expression *G) {
    return "dir = back";
  }
};

} // end namespace llvm

namespace optmig {

template <> struct JSONGraphTraits<const Expression *> : public DefaultJSONGraphTraits {
  JSONGraphTraits() : DefaultJSONGraphTraits() {}
  static u_int64_t getUniqueNodeID(const ExpressionNode &N) { return (u_int64_t) static_cast<const void *>(&N); }

  static std::string getNodeAttributes(const ExpressionNode &N, const Expression &E);
};
}

#endif /* EXPRESSION_H_ */
