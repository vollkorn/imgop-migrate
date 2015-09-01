/*
 * CFGNode.h
 *
 *  Created on: Jul 9, 2015
 *      Author: lukas
 */

#ifndef SCFG_HEADER_H_
#define SCFG_HEADER_H_

#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"

#include "Expression.h"
#include "JSONGraphWriter.h"

#include <fstream>

using namespace llvm;

using jsoncons::json;
using jsoncons::json_serializer;

namespace optmig {

class AbstractCFGNode {

public:
  friend class AbstractCFG;

  typedef std::vector<AbstractCFGNode *>::iterator iterator;
  typedef std::vector<AbstractCFGNode *>::const_iterator const_iterator;

  inline iterator begin() { return Successors.begin(); }
  inline iterator end() { return Successors.end(); }

  inline const_iterator begin() const { return Successors.begin(); }
  inline const_iterator end() const { return Successors.end(); }

  enum Label {
    ENTRY,
    EXIT,
    LOOP_HEADER,
    LOOP_PRE_HEADER,
    LOOP_INC,
    LOOP_EXIT,
    LOOP_BODY,
    CFG_UNKNOWN,
  };

public:
  AbstractCFGNode(AbstractCFGNode::Label label, BasicBlock *BB = nullptr) : BB(BB) { this->Labels.push_back(label); }
  AbstractCFGNode(ArrayRef<AbstractCFGNode::Label> labels, BasicBlock *BB = nullptr) : Labels(labels), BB(BB) {}

  virtual ~AbstractCFGNode() {
    for (int i = 0; i < Expressions.size(); ++i) {
      Expression *E = Expressions.back();
      Expressions.pop_back();
      delete E;
    }
  }

  void print(raw_ostream &O) const;

  bool instanceof(AbstractCFGNode::Label l) const {
    auto it = std::find_if(Labels.begin(), Labels.end(), [&l](AbstractCFGNode::Label label) { return label == l; });
    return it != Labels.end();
  }

  void add_label(AbstractCFGNode::Label label) { Labels.push_back(label); }

  u_int64_t get_uid() const {
    return (u_int64_t) static_cast<const void *>(this);
  };

  std::string to_string(AbstractCFGNode::Label label) const { return str_labels[label]; }

  const ArrayRef<AbstractCFGNode::Label> get_labels() const { return Labels; }

  BasicBlock *getBasicBlock() const { return BB; }

  const std::vector<Expression *> &get_expressions() const { return Expressions; }

  const Expression *get_expression_by(unsigned opcode) const {

    auto it = std::find_if(Expressions.begin(), Expressions.end(), [&opcode](Expression *e) {
      if (Instruction *inst = dyn_cast<Instruction>(e->getRoot()->getValue()))
        return inst->getOpcode() == opcode;
      return false;
    });

    if (it == Expressions.end())
      return nullptr;

    return *it;
  }

  AbstractCFG *get_parent() { return Parent; }

  void add_expression(std::vector<Expression *> Expressions) {

    for (Expression *E : Expressions)
      add_expression(E);
  }

  void add_expression(Expression *E) {
    if (E != nullptr) {
      E->set_parent(this);
      Expressions.push_back(E);
    }
  }

private:
  std::vector<Expression *> Expressions;

  BasicBlock *BB;

  AbstractCFG *Parent = nullptr;

  std::vector<AbstractCFGNode::Label> Labels;

  std::vector<AbstractCFGNode *> Successors;

  const std::vector<std::string> str_labels = { "entry",    "exit",      "loop_header", "loop_pre_header",
                                                "loop_inc", "loop_exit", "loop_body",   "unknown" };

  void add_child(AbstractCFGNode *node) {

    if (node != nullptr)
      Successors.push_back(node);
  }

  void set_parent(AbstractCFG *Parent) { this->Parent = Parent; }
};
}

namespace optmig {

// Simplified control flow graph
class AbstractCFG {

public:
  typedef std::vector<AbstractCFGNode *>::iterator iterator;
  typedef std::vector<AbstractCFGNode *>::const_iterator const_iterator;

  inline iterator nodes_begin() { return Nodes.begin(); }
  inline iterator nodes_end() { return Nodes.end(); }

  inline const_iterator nodes_begin() const { return Nodes.begin(); }
  inline const_iterator nodes_end() const { return Nodes.end(); }

private:
  AbstractCFG() : F(nullptr) {};
  AbstractCFG(Function *F) : F(F) {};

  AbstractCFG(AbstractCFG const &) = delete;
  void operator=(AbstractCFGNode const &) = delete;

  DenseMap<const BasicBlock *, AbstractCFGNode *> NodeBBmap;

  void add_node(AbstractCFGNode *node) {
    node->set_parent(this);
    Nodes.push_back(node);
    if (const BasicBlock *BB = node->getBasicBlock())
      NodeBBmap.insert(std::make_pair(BB, node));
  }

  // Traverse CFG in DFS order and create a simplified version
  static bool recursiveTraverse(AbstractCFG *T, BasicBlock *BB, AbstractCFGNode *parent,
                                std::set<BasicBlock *> &visited, LoopInfo *LI, ScalarEvolution *SE);

  std::vector<AbstractCFGNode *> Nodes;

  Function *F;

  static const AbstractCFG *_deserialize(LLVMContext &context, const json &Pattern);

public:
  virtual ~AbstractCFG() {

    // Free nodes
    for (int i = 0; i < Nodes.size(); i++)
      delete Nodes[i];
  };
  ///
  /// Requires that all loops are in normalized form
  /// Returns CFG on success, null otherwise
  static const AbstractCFG *createAbstractCFG(Function *F, LoopInfo &LI, ScalarEvolution &SE, DominatorTree &DT);

  AbstractCFGNode *get_node(BasicBlock *BB) const;

  AbstractCFGNode *get_node(u_int64_t _id);

  Function *get_function() const { return F; }

  static const AbstractCFG *deserialize(LLVMContext &context, const json &obj) { return _deserialize(context, obj); }
  static void serialize(const AbstractCFG *G, const std::string &name) { WriteJSONGraph(G, name); }
};
}

//===----------------------------------------------------------------------===//
// GraphTraits specializations for simplified CFG so that they can be treated as
// graphs by the generic graph algorithms.
//

// Provide graph traits for tranversing simplified CFG using standard graph
// traversals.
namespace llvm {

using optmig::AbstractCFG;
using optmig::AbstractCFGNode;

template <> struct GraphTraits<AbstractCFGNode *> {

  typedef AbstractCFGNode NodeType;
  typedef AbstractCFGNode::iterator ChildIteratorType;

  static NodeType *getEntryNode(AbstractCFGNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<const AbstractCFGNode *> {
  typedef const AbstractCFGNode NodeType;
  typedef NodeType::const_iterator ChildIteratorType;

  static NodeType *getEntryNode(const AbstractCFGNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(const NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(const NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<AbstractCFG *> : public GraphTraits<AbstractCFGNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef AbstractCFG::iterator nodes_iterator;

  static NodeType *getEntryNode(AbstractCFG *scfg) { return *(scfg->nodes_begin()); }

  static nodes_iterator nodes_begin(AbstractCFG *scfg) { return scfg->nodes_begin(); }
  static nodes_iterator nodes_end(AbstractCFG *scfg) { return scfg->nodes_end(); }
};

template <> struct GraphTraits<const AbstractCFG *> : public GraphTraits<const AbstractCFGNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef AbstractCFG::const_iterator nodes_iterator;

  static NodeType *getEntryNode(const AbstractCFG *scfg) { return *(scfg->nodes_begin()); }

  static nodes_iterator nodes_begin(const AbstractCFG *scfg) { return scfg->nodes_begin(); }
  static nodes_iterator nodes_end(const AbstractCFG *scfg) { return scfg->nodes_end(); }
};

template <> struct DOTGraphTraits<const AbstractCFG *> : public DefaultDOTGraphTraits {

  DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

  static std::string getGraphName(const AbstractCFG *T) { return "Abstract control flow graph"; }

  std::string getNodeLabel(const AbstractCFGNode *Node, const AbstractCFG *Graph) {

    std::string lbl;
    raw_string_ostream _strstream(lbl);
    Node->print(_strstream);

    return lbl;
  }

  static void addCustomGraphFeatures(const AbstractCFG *Graph, GraphWriter<const AbstractCFG *> &writer) {
    raw_ostream &O = writer.getOStream();

    for (AbstractCFGNode::const_iterator NB = Graph->nodes_begin(), NE = Graph->nodes_end(); NB != NE; ++NB) {
      const AbstractCFGNode *Node = *NB;
      const std::vector<Expression *> &expressions = Node->get_expressions();
      if (!expressions.empty()) {
        for (auto it = expressions.begin(), ite = expressions.end(); it != ite; ++it) {
          Expression *e = *it;
          GraphWriter<const Expression *> ExpressionWriter(O, e, false);
          const ExpressionNode *Root = e->getRoot();

          O << "\tsubgraph cluster_" << static_cast<const void *>(Root) << "{ \n";
          O << "label =\"\""
            << "\n";
          ExpressionWriter.writeNodes();
          O << "} \n";

          // draw an edge from root node of assign expression tree to corresponding CFG node
          O << "\tNode" << static_cast<const void *>(Node) << " -> "
            << "Node" << static_cast<const void *>(Root) << " [style=dotted]"
            << "\n";
        }
      }
    }
  }
};

} // end namespace llvm

namespace optmig {

template <> struct JSONGraphTraits<const AbstractCFG *> : public DefaultJSONGraphTraits {
  JSONGraphTraits() : DefaultJSONGraphTraits() {}

  std::string getGraphName(const AbstractCFG &G) {
    Function *F = G.get_function();
    return F ? F->getName() : "";
  }

  static u_int64_t getUniqueNodeID(const AbstractCFGNode &N) { return (u_int64_t)N.get_uid(); }

  std::string getGraphAttributes(const AbstractCFG &G) {

    Function *F = G.get_function();
    std::string str;
    raw_string_ostream O(str);
    O << "{ ";
    O << "\"datalayout\": \"" << F->getParent()->getDataLayoutStr() << "\",";

    O << "\"interface\": ";
    O << "\"";
    O << "define " << *F->getReturnType() << " @" << F->getName() << "(";
    Function::ArgumentListType &arglist = F->getArgumentList();
    int index = 0;
    for (auto i = arglist.begin(), e = arglist.end(); i != e; ++i) {
      Argument *arg = &*i;
      O << *arg;
      if (++index != arglist.size())
        O << ", ";
    }
    O << ")\",";
    O << "\"hw_interface\": {";
    O << "\"name\": \"\",";
    O << "\"binding\": [] ";
    O << "}";
    O << "}";
    return O.str();
  }

  static std::string getNodeAttributes(const AbstractCFGNode &N, const AbstractCFG &G) {

    std::string str;
    raw_string_ostream O(str);
    O << "{ ";
    O << "\"labels\": ";

    ArrayRef<AbstractCFGNode::Label> label = N.get_labels();
    if (label.empty()) {
    	O << "[],";
    } else{

      std::string label_string = "[";
      std::for_each(label.begin(), label.end(),
                    [&label_string](AbstractCFGNode::Label label) { label_string += std::to_string(label) + ","; });
      label_string.erase(label_string.end() - 1, label_string.end());
      label_string += "]";
      O << label_string << ",";

    }
    const BasicBlock *BB = N.getBasicBlock();

    O << "\"name\": \"" << BB->getName() << "\",";
    O << "\"ir\": [";
    int index = 0;
    for (BasicBlock::const_iterator i = BB->begin(), e = BB->end(); i != e; ++i) {
      // The next statement works since operator<<(ostream&,...)
      // is overloaded for Instruction&
      O << "\"" << *i << "\"";
      if (++index != BB->getInstList().size())
        O << ",";
    }
    O << "]";

    O << " }";
    return O.str();
  }
};
}

#endif /* CFG_HEADER_H_ */
