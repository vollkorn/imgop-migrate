/*
 * CFGNode.h
 *
 *  Created on: Jul 9, 2015
 *      Author: lukas
 */

#ifndef CFG_HEADER_H_
#define CFG_HEADER_H_

#include "llvm/IR/Function.h"

#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/LoopInfo.h"

#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/CFG.h"

#include "jsoncons/json.hpp"

#include "ExpressionTree.h"

using namespace llvm;

using jsoncons::json;
using jsoncons::json_serializer;

namespace {

// Forward declarations

class SCFGNode {

public:
  friend class SCFG;

  typedef std::vector<SCFGNode *>::iterator iterator;
  typedef std::vector<SCFGNode *>::const_iterator const_iterator;

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

private:
  unsigned _uid = 0;

  static std::vector<std::string> str_labels;

  void add_successor(SCFGNode *node) { Successors.push_back(node); }

public:
  SCFGNode(SCFGNode::Label label, BasicBlock *BB, unsigned UID = 0, ExpressionTree *A = nullptr)
      : _uid(UID), BB(BB), A(A) {
    this->Labels.push_back(label);
  }
  SCFGNode(ArrayRef<SCFGNode::Label> labels, BasicBlock *BB, ExpressionTree *A = nullptr) : BB(BB), A(A) {
    std::copy(labels.begin(), labels.end(), this->Labels.begin());
  }
  ~SCFGNode() {}

  void print(raw_ostream &O) const {
    for (auto label : Labels)
      O << to_string(label) << "\n";

    if (BB)
      O << BB->getName() << "\n";

    O << "ID: " << _uid << "\n";
  }

  void add_label(SCFGNode::Label label) { Labels.push_back(label); }

  ExpressionTree *getExpressionTree() const { return A; }

  static std::string to_string(SCFGNode::Label label) { return str_labels[label]; }

private:
  const SmallVector<SCFGNode::Label, 8> &get_labels() const { return Labels; }

  ExpressionTree *A;

  SmallVector<SCFGNode::Label, 8> Labels;

  BasicBlock *BB;

  std::vector<SCFGNode *> Successors;
};

const char *str_labels_init[] = { "entry",    "exit",      "loop_header", "loop_pre_header",
                                  "loop_inc", "loop_exit", "loop_body",   "unknown" };

std::vector<std::string> SCFGNode::str_labels(str_labels_init, std::end(str_labels_init));

// Simplified control flow graph node
class SCFG {

public:
  typedef std::vector<SCFGNode *>::iterator iterator;
  typedef std::vector<SCFGNode *>::const_iterator const_iterator;

  inline iterator nodes_begin() { return Nodes.begin(); }
  inline iterator nodes_end() { return Nodes.end(); }

  inline const_iterator nodes_begin() const { return Nodes.begin(); }
  inline const_iterator nodes_end() const { return Nodes.end(); }

private:
  SCFG(Function *F) : F(F) {};

  SCFG(SCFG const &) = delete;
  void operator=(SCFG const &) = delete;

  DenseMap<BasicBlock *, SCFGNode *> NodeBBmap;

  void add_node(SCFGNode *node) {

    Nodes.push_back(node);

    NodeBBmap.insert(std::make_pair(node->BB, node));
  }

  SCFGNode *get_node(BasicBlock *BB) { return NodeBBmap[BB]; }

  // Traverse CFG in DFS order and create a simplified version
  static bool recursiveTraverse(SCFG *T, BasicBlock *BB, SCFGNode *parent, std::set<BasicBlock *> &visited,
                                LoopInfo *LI, ScalarEvolution *SE);

  std::vector<SCFGNode *> Nodes;

  Function *F;

public:
  ~SCFG() {};
  ///
  /// Requires that all loops are in normalized form
  /// Returns SCFG on success, null otherwise
  static const SCFG *createSimplifiedCFG(Function *F, LoopInfo *LI, ScalarEvolution *SE) {

    SCFG *T = new SCFG(F);

    BasicBlock *entry = &F->getEntryBlock();

    std::set<BasicBlock *> visited;

    bool loopssimplified = true;
    for (LoopInfo::iterator LB = LI->begin(), LE = LI->end(); LB != LE; ++LB) {
      Loop *L = *LB;
      loopssimplified &= L->isLoopSimplifyForm();

      for (Loop::block_iterator LBB = L->block_begin(), LBE = L->block_end(); LBB != LBE; ++LBB) {
        BasicBlock *BB = *LBB;

        if (L->isLoopExiting(BB)) {
          dbgs() << "Control flow not supported\n";
        }
      }
    }

    if (!loopssimplified)
      return nullptr;

    recursiveTraverse(T, entry, nullptr, visited, LI, SE);

    return T;
  }

  const SCFG *deserialize(const std::string &filename) { return nullptr; }

  void serialize(const std::string &filename) const {

    assert(filename.size() > 0 && "Filename is empty");

    json graph;
    json graph_arr(json::an_array);
    json nodes;
    json nodes_arr(json::an_array);

    json edges;
    json edges_arr(json::an_array);

    for (const_iterator NB = nodes_begin(), NE = nodes_end(); NB != NE; ++NB) {
      const SCFGNode *Node = *NB;

      json node;
      json labels(json::an_array);
      // Id of the node
      u_int64_t src_id = (u_int64_t)(static_cast<const void *>(Node));
      node["_id"] = src_id;

      // Labels
      for (auto label : Node->get_labels())
        labels.add(SCFGNode::to_string(label));
      node["labels"] = labels;

      // Edges
      for (SCFGNode::const_iterator SB = Node->begin(), SE = Node->end(); SB != SE; ++SB) {
        const SCFGNode *Dst = *SB;
        json edge;

        edge["src"] = src_id;
        edge["dst"] = (u_int64_t)(static_cast<const void *>(Dst));
        edges_arr.add(edge);
      }
      nodes_arr.add(node);
    }

    edges["edges"] = edges_arr;
    nodes["nodes"] = nodes_arr;

    graph_arr.add(nodes);
    graph_arr.add(edges);

    graph["graph"] = graph_arr;

    std::ofstream stream(filename);
    stream << pretty_print(graph);
  }
};

inline bool SCFG::recursiveTraverse(SCFG *T, BasicBlock *BB, SCFGNode *parent, std::set<BasicBlock *> &visited,
                                    LoopInfo *LI, ScalarEvolution *SE) {
  static unsigned UID = 0;
  std::pair<std::set<BasicBlock *>::iterator, bool> col = visited.insert(BB);
  if (col.second) {

    TerminatorInst *term = BB->getTerminator();
    SCFGNode *node = nullptr;

    ExpressionTree *ET = ExpressionTree::calculateExpressionTree(BB, SE, LI);

    // Categorize BBs according to their role in the CFG
    if (parent == nullptr) {
      node = new SCFGNode(SCFGNode::ENTRY, BB, ET);

    } else if (!term->getNumSuccessors() == 0) {

      // Check if block is pre-header for a loop
      if (term->getNumSuccessors() == 1) {
        BasicBlock *successor = term->getSuccessor(0);
        if (Loop *L = LI->getLoopFor(successor))
          if (BB == L->getLoopPreheader())
            node = new SCFGNode(SCFGNode::LOOP_PRE_HEADER, BB, ++UID, ET); // Preheader = all instructions are loop invariant
      }

      if (BasicBlock *predecessor = BB->getSinglePredecessor()) {
        if (Loop *L = LI->getLoopFor(predecessor))
          if (BB == L->getExitBlock())
            if (!node)
              node = new SCFGNode(SCFGNode::LOOP_EXIT, BB, ++UID, ET);
            else
              node->add_label(SCFGNode::LOOP_EXIT);
      }

      if (!node)
        // Check if BB is loop related
        if (Loop *L = LI->getLoopFor(BB)) { // innermost loop
          // categorize role of BB in loop
          if (L->getHeader() == BB) // I some circumstances loop header is equal to loop body
            node = new SCFGNode(SCFGNode::LOOP_HEADER, BB, ++UID, ET);
          else if (L->getLoopLatch() == BB)
            node = new SCFGNode(SCFGNode::LOOP_INC, BB, ++UID, ET);
          //          else if (L->getExitBlock())
          //            node = new SCFGNode(SCFGNode::LOOP_EXIT, BB, ET);
          else
            // anything remaining is either part of a sub-loop, or a loop body
            node = new SCFGNode(SCFGNode::LOOP_BODY, BB, ++UID, ET);
        }

    } else { // Loops without successor are exit blocks
      node = new SCFGNode(SCFGNode::EXIT, BB, ++UID, ET);
    }

    if (nullptr == node)
      node = new SCFGNode(SCFGNode::CFG_UNKNOWN, BB, ++UID, ET);

    T->add_node(node);
    if (parent)
      parent->add_successor(node);

    for (succ_iterator IB = succ_begin(BB), IE = succ_end(BB); IB != IE; ++IB)
      if (!recursiveTraverse(T, *IB, node, visited, LI, SE))
        return false;
  } else {
    // CFG contains backedge
    parent->add_successor(T->get_node(BB));
  }
  return true;
}
}

//===----------------------------------------------------------------------===//
// GraphTraits specializations for simplified CFG so that they can be treated as
// graphs by the generic graph algorithms.
//

// Provide graph traits for tranversing simplified CFG using standard graph
// traversals.
namespace llvm {

template <> struct GraphTraits<SCFGNode *> {

  typedef SCFGNode NodeType;
  typedef SCFGNode::iterator ChildIteratorType;

  static NodeType *getEntryNode(SCFGNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<const SCFGNode *> {
  typedef const SCFGNode NodeType;
  typedef NodeType::const_iterator ChildIteratorType;

  static NodeType *getEntryNode(const SCFGNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(const NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(const NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<SCFG *> : public GraphTraits<SCFGNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef SCFG::iterator nodes_iterator;

  static NodeType *getEntryNode(SCFG *scfg) { return *(scfg->nodes_begin()); }

  static nodes_iterator nodes_begin(SCFG *scfg) { return scfg->nodes_begin(); }
  static nodes_iterator nodes_end(SCFG *scfg) { return scfg->nodes_end(); }
};

template <> struct GraphTraits<const SCFG *> : public GraphTraits<SCFGNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef SCFG::const_iterator nodes_iterator;

  static NodeType *getEntryNode(const SCFG *scfg) { return *(scfg->nodes_begin()); }

  static nodes_iterator nodes_begin(const SCFG *scfg) { return scfg->nodes_begin(); }
  static nodes_iterator nodes_end(const SCFG *scfg) { return scfg->nodes_end(); }
};

template <> struct DOTGraphTraits<const SCFG *> : public DefaultDOTGraphTraits {

  DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

  static std::string getGraphName(const SCFG *T) { return "Abstract control flow graph"; }

  std::string getNodeLabel(const SCFGNode *Node, const SCFG *Graph) {

    std::string lbl;
    raw_string_ostream _strstream(lbl);
    Node->print(_strstream);

    return lbl;
  }

  static void addCustomGraphFeatures(const SCFG *Graph, GraphWriter<const SCFG *> &writer) {
    raw_ostream &O = writer.getOStream();

    for (SCFG::const_iterator NB = Graph->nodes_begin(), NE = Graph->nodes_end(); NB != NE; ++NB) {
      const SCFGNode *Node = *NB;
      ExpressionTree *T = Node->getExpressionTree();

      if (T) {
        GraphWriter<const ExpressionTree *> ExpreTreeWriter(O, T, false);
        ExpressionTreeNode *Troot = T->getRoot();

        O << "\tsubgraph cluster_" << static_cast<const void *>(Troot) << "{ \n";
        O << "label =\"\""
          << "\n";
        ExpreTreeWriter.writeNodes();
        O << "} \n";

        // draw an edge from root node of expression tree to corresponding CFG node
        O << "\tNode" << static_cast<const void *>(Node) << " -> "
          << "Node" << static_cast<const void *>(Troot) << " [style=dotted]"
          << "\n";
      }
    }
  }
};

} // end namespace llvm

#endif /* CFG_HEADER_H_ */
