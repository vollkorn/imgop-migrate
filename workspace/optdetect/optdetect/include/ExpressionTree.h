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
#include "llvm/IR/Instructions.h"

#include "llvm/ADT/GraphTraits.h"

#include "llvm/Support/raw_ostream.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"

#include <set>

using namespace llvm;

namespace {

struct ExpressionTreeNode;

class ExpressionTree {

	friend class ExpressionTreeNode;

public:

  virtual ~ExpressionTree() {}


  static ExpressionTree* calculateExpressionTree(BasicBlock *BB, ScalarEvolution* SE, LoopInfo* LI);

  typedef std::vector<ExpressionTreeNode*>::iterator iterator;
  typedef std::vector<ExpressionTreeNode*>::const_iterator const_iterator;

  inline iterator nodes_begin() { return Nodes.begin(); }
  inline iterator nodes_end() { return Nodes.end(); }

  inline const_iterator nodes_begin() const { return Nodes.begin(); }
  inline const_iterator nodes_end() const { return Nodes.end(); }

  ExpressionTreeNode* getRoot() { return *(nodes_begin()); }

private:

  static ExpressionTreeNode *calculateAssignmentSubtree(ExpressionTree *tree , StoreInst *store, ScalarEvolution* SE, LoopInfo* LI);

  ExpressionTree() {}

  std::vector<ExpressionTreeNode *> Nodes;
};
}


namespace {

struct ExpressionTreeNode {

  friend class ExpressionTree;

  enum Label{ ROOT,
	  ASSIGN, SUBSCRIPT, INDUCTION,
	  ADD, SUB, MUL, DIV, CONST, VAR,
	  ITOF, FTOI, TRUNC, SEXT, ZEXT,
	  LOOP, IF_THEN_ELSE, IF, ELSE, bla
  };

private:
  std::vector<std::string> str_labels = { "root", "=", "[]", "iv", "+", "-", "*", "/",
		  	  	  	  	  	  	  	  	  "const", "var", "I to F", "F to I",
										  "trunc", "sext", "zext", "loop", "if-then-else", "if", "else", "bla"};

public:

  typedef std::vector<ExpressionTreeNode*>::iterator iterator;
  typedef std::vector<ExpressionTreeNode*>::const_iterator const_iterator;

  inline iterator begin() { return Children.begin(); }
  inline iterator end() { return Children.end(); }

  inline const_iterator begin() const { return Children.begin(); }
  inline const_iterator end() const { return Children.end(); }

  void add_child(iterator it, ExpressionTreeNode* node) { Children.insert(it, node); }

  std::string getLabel() const { return str_labels[Label]; }

  Value* getValue() const { return V; }

  void print(raw_ostream &O) const {

	O << str_labels[Label] << "\n";

    if (isInstanceOf(ExpressionTreeNode::CONST) || isInstanceOf(ExpressionTreeNode::VAR) ||
        isInstanceOf(ExpressionTreeNode::INDUCTION)) {
      O << "\n";
      if (isInstanceOf(ExpressionTreeNode::INDUCTION)) {
        O << "Steps by: ";
        if(Step)
        	O << *(Step->getValue());
        else
        	O << "unknown";
        O << "\n";
      } else {
        O << *V;
      }
    }
  }

  const SCEVConstant* getStep() const { return Step; }

  ExpressionTreeNode(ExpressionTree* T, ExpressionTreeNode::Label lbl,
		  	  	  	 Value* v, const SCEVConstant* Step = nullptr)
  	  	  	  	  	  : T(T), Label(lbl), V(v), Step(Step) {
	T->Nodes.push_back(this);
  }

  bool isInstanceOf(ExpressionTreeNode::Label lbl) const {  return lbl == this->Label;  }

private:
  ExpressionTreeNode::Label Label;

  Value* V;

  ExpressionTree* T;

  const SCEVConstant* Step;

  std::vector<ExpressionTreeNode*> Children;
};
}

//===----------------------------------------------------------------------===//
// GraphTraits specializations for partial expression trees so that they can be treated as
// graphs by the generic graph algorithms.
//

// Provide graph traits for tranversing partial expression trees (graphs) using standard graph
// traversals.
namespace llvm{


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

template <>
struct GraphTraits<ExpressionTree *> : public GraphTraits<ExpressionTreeNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef ExpressionTree::iterator nodes_iterator;

  static NodeType *getEntryNode(ExpressionTree *expr) {
    return *(expr->nodes_begin());
  }

  static nodes_iterator nodes_begin(ExpressionTree *expr) {
    return expr->nodes_begin();
  }
  static nodes_iterator nodes_end(ExpressionTree *expr) {
	  return expr->nodes_end();
  }

};

template <>
struct GraphTraits< const ExpressionTree *> : public GraphTraits<ExpressionTreeNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef ExpressionTree::const_iterator nodes_iterator;

  static NodeType *getEntryNode(const ExpressionTree *expr) {
    return *(expr->nodes_begin());
  }

  static nodes_iterator nodes_begin(const ExpressionTree *expr) {
    return expr->nodes_begin();
  }
  static nodes_iterator nodes_end(const ExpressionTree *expr) {
	  return expr->nodes_end();
  }

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



#endif /* EXPRESSIONTREE_H_ */
