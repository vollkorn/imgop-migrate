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
#include "GraphMatching.h"

#include <set>
#include <algorithm>
#include <string>

using namespace llvm;

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

  static std::vector<Expression *> calculateExpressions(BasicBlock *BB, ScalarEvolution *SE, LoopInfo *LI);

  static Expression *deserialize(BasicBlock *BB, const std::string &str, ScalarEvolution *SE,
                                 std::map<u_int64_t, ExpressionNode *> &lazyReferences) {

    json v = json::parse_string(str);
    return deserialize(BB, v, SE, lazyReferences);
  }

  static ExpressionNode *deserialize_rec(BasicBlock *BB, Expression *T, json &curr, json &G, ScalarEvolution *SE,
                                         std::map<u_int64_t, ExpressionNode *> &lazy_references);

  static Type *type_from_str(LLVMContext &context, std::string &str);

  static Expression *deserialize(BasicBlock *BB, json &obj, ScalarEvolution *SE,
                                 std::map<u_int64_t, ExpressionNode *> &lazyReferences);

private:
  void add_node(ExpressionNode *node);
  void set_parent(AbstractCFGNode *Node) { Parent = Node; }

  static Expression *calculateAssignmentExpression(StoreInst *, ScalarEvolution *SE, LoopInfo *LI);

  static Expression *calculateBranchExpression(TerminatorInst *, ScalarEvolution *SE, LoopInfo *LI);

  static Expression *calculateExpression(Instruction *inst, ScalarEvolution *SE, LoopInfo *LI);

  std::map<Value *, ExpressionNode *> value_node_map;

  explicit Expression(bool pattern = false) : is_pattern(pattern) {}

  std::vector<ExpressionNode *> Nodes;

  bool is_pattern = false;

  AbstractCFGNode *Parent = nullptr;
};
}

namespace optmig {

struct InductionDescription;

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

  bool maps_to(const ExpressionNode &other) const;

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

  const InductionDescription *getInductionDescription() const { return ival; }

  ExpressionNode(Expression *Parent, Value *V, AbstractCFGNode *Reference = nullptr)
      : Parent(Parent), V(V), Reference(Reference) {}

  ExpressionNode(Expression *Parent, Value *V, InductionDescription *IV, AbstractCFGNode *Reference = nullptr)
      : ExpressionNode(Parent, V, Reference) {
    ival = IV;
  }

  virtual ~ExpressionNode() {}

  bool isInductionValue() const { return isInstanceOf(Instruction::PHI) && ival != nullptr; }

  bool isInstanceOf(unsigned opcode) const {
    if (Instruction *inst = dyn_cast<Instruction>(V))
      return inst->getOpcode() == opcode;
    return false;
  }

  AbstractCFGNode *get_reference() const { return Reference; }

private:
  u_int64_t _internal_id = 0;

  Value *V;

  Expression *Parent;

  AbstractCFGNode *Reference;

  InductionDescription *ival = nullptr;

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

namespace {
// Helper class working with SCEVTraversal to figure out if a SCEV contains
// a SCEVUnknown with null value-pointer. FindInvalidSCEVUnknown::FindOne
// is set iff if find such SCEVUnknown.
//
struct SCEVTraversalCollectUnknows {

  ScalarEvolution *SE;
  SmallVector<Value *, 8> &U;
  SmallVector<Value *, 8> *E;
  SCEVTraversalCollectUnknows(ScalarEvolution *SE, SmallVector<Value *, 8> &unknowns,
                              SmallVector<Value *, 8> *exceptions = nullptr)
      : SE(SE), U(unknowns), E(exceptions) {}

  bool follow(const SCEV *S) {
    if (const SCEVUnknown *unknown = dyn_cast<SCEVUnknown>(S)) {
      if(std::find_if(U.begin(), U.end(), [&unknown](Value* v){ return v == unknown->getValue();}) != U.end())
    	  return true;
      if (E) {
        if (std::find(E->begin(), E->end(), unknown->getValue()) == E->end()) // S not in exceptions
          U.push_back(unknown->getValue());
      } else
        U.push_back(unknown->getValue());
    }
    return true;
  }
  bool isDone() const { return false; }
};
}

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
  InductionDescription(const SCEV *Start, const SCEV *Step, const SCEV *Exit) {
    this->Start = Start;
    this->Step = Step;
    this->Exit = Exit;
  }

  const SCEV *getInit() const { return Start; }
  const SCEV *getStep() const { return Step; }
  const SCEV *getExit() const { return Exit; }

  bool valid() const { return Start != nullptr && Step != nullptr && Exit != nullptr; }

  void print(raw_ostream &O) const { O << "(" << *Start << ", " << *Step << ", " << *Exit << ")"; }

  bool visit_SCEV_Constant(const SCEV *SLhs, const SCEV *SRhs) const {
    const SCEVConstant *lhs = dyn_cast<SCEVConstant>(SLhs);
    const SCEVConstant *rhs = dyn_cast<SCEVConstant>(SRhs);

    if (nullptr == lhs || nullptr == rhs)
      return false;

    return lhs->getValue()->getValue().eq(rhs->getValue()->getValue());
  }

  bool visit_SCEV_Unknown(const SCEV *SLhs, const SCEV *SRhs,
                          std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &A) const {

    const SCEVUnknown *lhs = dyn_cast<SCEVUnknown>(SLhs);
    const SCEVUnknown *rhs = dyn_cast<SCEVUnknown>(SRhs);

    if (nullptr == lhs || nullptr == rhs)
      return false;
    // lhs is pattern...
    Instruction *isnt = dyn_cast<Instruction>(lhs->getValue());
    // TODO: check if these values were mapped

    for (auto ite = A.begin(), ite_end = A.end(); ite != ite_end; ++ite) {
      auto matchings = (*ite).second;
      for (auto it = matchings.begin(), end = matchings.end(); it != end; ++it) {

        ExpressionNode *pattern_node = (*it).first;
        ExpressionNode *candidate_node = (*it).second;

        if (pattern_node->getValue() == lhs->getValue())
          if (candidate_node->getValue() == rhs->getValue())
            return true;
      }
    }
    return false;
  }
  bool traverse_SCEV(const SCEV *lhs, const SCEV *rhs,
                     std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &A) const {

    SmallVector<const SCEV *, 8> Worklist_Lhs;
    SmallVector<const SCEV *, 8> Worklist_Rhs;
    SmallPtrSet<const SCEV *, 8> Visited_Lhs;
    SmallPtrSet<const SCEV *, 8> Visited_Rhs;

    auto push_lhs = [&](const SCEV *S) {
      if (Visited_Lhs.insert(S).second)
        Worklist_Lhs.push_back(S);
    };

    auto push_rhs = [&](const SCEV *S) {
      if (Visited_Rhs.insert(S).second)
        Worklist_Rhs.push_back(S);
    };
    Worklist_Lhs.push_back(lhs);
    Worklist_Rhs.push_back(rhs);
    while (!Worklist_Lhs.empty() || !Worklist_Rhs.empty()) {

      const SCEV *SLhs = Worklist_Lhs.pop_back_val();
      const SCEV *SRhs = Worklist_Rhs.pop_back_val();

      if (SLhs->getSCEVType() != SRhs->getSCEVType())
        return false;

      switch (SLhs->getSCEVType()) {
      case scConstant:
        if (!visit_SCEV_Constant(SLhs, SRhs))
          return false;
        break;
      case scUnknown:
        if (!visit_SCEV_Unknown(SLhs, SRhs, A))
          return false;
        break;
      case scTruncate:
      case scZeroExtend:
      case scSignExtend:
        push_lhs(cast<SCEVCastExpr>(SLhs)->getOperand());
        push_rhs(cast<SCEVCastExpr>(SRhs)->getOperand());
        break;
      case scAddExpr:
      case scMulExpr:
      case scSMaxExpr:
      case scUMaxExpr:
      case scAddRecExpr: {
        const SCEVNAryExpr *NAry_lhs = cast<SCEVNAryExpr>(SLhs);
        for (SCEVNAryExpr::op_iterator I = NAry_lhs->op_begin(), E = NAry_lhs->op_end(); I != E; ++I) {
          push_lhs(*I);
        }

        const SCEVNAryExpr *NAry_rhs = cast<SCEVNAryExpr>(SRhs);
        for (SCEVNAryExpr::op_iterator I = NAry_rhs->op_begin(), E = NAry_rhs->op_end(); I != E; ++I) {
          push_rhs(*I);
        }

        break;
      }
      case scUDivExpr: {
        const SCEVUDivExpr *UDivLhs = cast<SCEVUDivExpr>(SLhs);
        push_lhs(UDivLhs->getLHS());
        push_lhs(UDivLhs->getRHS());

        const SCEVUDivExpr *UDivRhs = cast<SCEVUDivExpr>(SRhs);
        push_rhs(UDivRhs->getLHS());
        push_rhs(UDivRhs->getRHS());

        break;
      }
      case scCouldNotCompute:
        llvm_unreachable("Attempt to use a SCEVCouldNotCompute object!");
      default:
        llvm_unreachable("Unknown SCEV kind!");
      }
    }
    //	  lhs->
    return true;
  }

  bool map_to(const InductionDescription *other,
              std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &A) const {

    if (!valid() || !other->valid())
      return false;

    bool match = true;

    match &= traverse_SCEV(Start, other->Start, A);
    match &= traverse_SCEV(Step, other->Step, A);
    match &= traverse_SCEV(Exit, other->Exit, A);

    return match;
  }
};
}

#endif /* EXPRESSION_H_ */
