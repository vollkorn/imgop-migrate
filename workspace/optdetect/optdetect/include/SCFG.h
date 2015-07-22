/*
 * CFGNode.h
 *
 *  Created on: Jul 9, 2015
 *      Author: lukas
 */

#ifndef SCFG_HEADER_H_
#define SCFG_HEADER_H_

#include <fstream>

#include "llvm/IR/Function.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/CFG.h"

#include "JSONGraphWriter.h"

#include "ExpressionTree.h"

using namespace llvm;

using jsoncons::json;
using jsoncons::json_serializer;

namespace {

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
  static std::vector<std::string> str_labels;

  void add_child(SCFGNode *node) { Successors.push_back(node); }

public:
  SCFGNode(SCFGNode::Label label, BasicBlock *BB = nullptr, const ExpressionTree *AssignExpr = nullptr,
           const ExpressionTree *BranchExpr = nullptr)
      : BB(BB), AssignExpr(AssignExpr), BranchExpr(BranchExpr) {

    this->Labels.push_back(label);
  }
  SCFGNode(ArrayRef<SCFGNode::Label> labels, BasicBlock *BB = nullptr, const ExpressionTree *AssignExpr = nullptr,
           const ExpressionTree *BranchExpr = nullptr)
      : Labels(labels), BB(BB), AssignExpr(AssignExpr), BranchExpr(BranchExpr) {}

  ~SCFGNode() {}

  void print(raw_ostream &O) const {

    O << get_uid();
    if (!Labels.empty()) {
      std::string lbl;
      lbl += " [";
      for (auto label : Labels)
        lbl += to_string(label) + ", ";

      lbl.erase(lbl.end() - 2, lbl.end());
      lbl += "]";
      O << lbl;
    }
    if (BB)
      O << " @ " << BB->getName();
  }

  void add_label(SCFGNode::Label label) { Labels.push_back(label); }

  u_int64_t get_uid() const {
    return (u_int64_t) static_cast<const void *>(this);
  };

  const ExpressionTree *getAssignmentExpression() const { return AssignExpr; }

  const ExpressionTree *getBranchExpression() const { return BranchExpr; }

  static std::string to_string(SCFGNode::Label label) { return str_labels[label]; }

  const ArrayRef<SCFGNode::Label> get_labels() const { return Labels; }

private:
  const ExpressionTree *AssignExpr;

  const ExpressionTree *BranchExpr;

  BasicBlock *BB;

  std::vector<SCFGNode::Label> Labels;

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
  SCFG() : F(nullptr) {};
  SCFG(Function *F) : F(F) {};

  SCFG(SCFG const &) = delete;
  void operator=(SCFG const &) = delete;

  DenseMap<BasicBlock *, SCFGNode *> NodeBBmap;

  void add_node(SCFGNode *node) {

    Nodes.push_back(node);

    NodeBBmap.insert(std::make_pair(node->BB, node));
  }

  SCFGNode *get_node(BasicBlock *BB) {

    if (NodeBBmap.find(BB) != NodeBBmap.end())
      return NodeBBmap[BB];
    return nullptr;
  }

  SCFGNode *get_node(u_int64_t _id) {
    iterator iter = std::find_if(Nodes.begin(), Nodes.end(), [&](SCFGNode *N) { return N->get_uid() == _id; });

    return *iter;
  }

  // Traverse CFG in DFS order and create a simplified version
  static bool recursiveTraverse(SCFG *T, BasicBlock *BB, SCFGNode *parent, std::set<BasicBlock *> &visited,
                                LoopInfo *LI, ScalarEvolution *SE);

  std::vector<SCFGNode *> Nodes;

  Function *F;

  static const SCFG *_deserialize(json Pattern) {

    std::map<unsigned, SCFGNode *> id_node_map;

    SCFG *G = new SCFG();

    json graph = Pattern["graph"];

    // iterate nodes
    json nodes_obj = graph[0];

    json nodes_arr = nodes_obj["nodes"];
    for (auto it = nodes_arr.begin_elements(); it != nodes_arr.end_elements(); ++it) {

      json attributes = (*it)["attributes"];
      std::vector<SCFGNode::Label> labels;
      const ExpressionTree *AT = nullptr;
      const ExpressionTree *BT = nullptr;

      if (!attributes.is_empty()) {

        if (attributes.has_member("labels")) {
          std::vector<unsigned> parsed_labels = attributes["labels"].as_vector<unsigned>();

          std::for_each(parsed_labels.begin(), parsed_labels.end(),
                        [&](unsigned lbl) { labels.push_back(static_cast<SCFGNode::Label>(lbl)); });
        }

        if (attributes.has_member("assignment"))
          AT = ExpressionTree::deserialize(attributes["assignment"]);

        if (attributes.has_member("branch")) {
          BT = nullptr; // XXX: implement this here
        }
      }
      SCFGNode *N = new SCFGNode(labels, nullptr, AT, BT);
      unsigned _id = (*it)["_id"].as_uint();
      id_node_map.insert(std::make_pair(_id, N));

      G->add_node(N);
    }

    // iterate edges
    json edges_obj = graph[1];
    json edges_arr = edges_obj["edges"];

    for (auto it = edges_arr.begin_elements(); it != edges_arr.end_elements(); ++it) {

      unsigned src_id = (*it)["src"].as_uint();
      unsigned dst_id = (*it)["dst"].as_uint();
      SCFGNode *&src = id_node_map[src_id];
      SCFGNode *&dst = id_node_map[dst_id];

      src->add_child(dst);
    }
    return G;
  }

public:
  ~SCFG() {};
  ///
  /// Requires that all loops are in normalized form
  /// Returns SCFG on success, null otherwise
  static const SCFG *createSimplifiedCFG(Function *F, LoopInfo &LI, ScalarEvolution &SE, DominatorTree &DT) {

    SCFG *T = new SCFG(F);

    BasicBlock *entry = &F->getEntryBlock();

    std::set<BasicBlock *> visited;

    bool loops_normalized = true;
    for (LoopInfo::iterator LB = LI.begin(), LE = LI.end(); LB != LE; ++LB) {
      Loop *L = *LB;
      if (!L->isLoopSimplifyForm() || !L->isLCSSAForm(DT)) {
        loops_normalized &= false;
        dbgs() << "Loops not normalized!\n";
      }
      SmallVector<BasicBlock *, 8> ExitBlocks;
      L->getExitBlocks(ExitBlocks);
      if (ExitBlocks.size() > 1) {
        dbgs() << "Control flow not supported!\n";
        loops_normalized &= false;
      }
    }

    if (!loops_normalized)
      return nullptr;

    recursiveTraverse(T, entry, nullptr, visited, &LI, &SE);

    return T;
  }
  static const SCFG *deserialize(std::ifstream &is) {
    const SCFG *H = nullptr;

    if (is.is_open()) {
      json v = json::parse(is);
      H = _deserialize(v);
      is.close();
    }
    return H;
  }
  static const SCFG *deserialize(const std::string &str) {

    json v = json::parse_string(str);
    return _deserialize(v);
  }

  static void serialize(const SCFG *G, const std::string &filename) { WriteJSONGraph(G, "foobar", "foobar"); }
};

inline bool SCFG::recursiveTraverse(SCFG *T, BasicBlock *BB, SCFGNode *parent, std::set<BasicBlock *> &visited,
                                    LoopInfo *LI, ScalarEvolution *SE) {
  static unsigned UID = 0;
  std::pair<std::set<BasicBlock *>::iterator, bool> col = visited.insert(BB);
  if (col.second) {

    TerminatorInst *term = BB->getTerminator();
    SCFGNode *node = nullptr;
    SmallVector<ExpressionTree *, 8> ExprTrees;
    const ExpressionTree *AssignET = ExpressionTree::calculateAssignmentSubtree(BB, SE, LI);
    const ExpressionTree *BranchET = ExpressionTree::calculateBranchExpression(BB, SE, LI);
    // Categorize BBs according to their role in the CFG
    if (parent == nullptr) {
      node = new SCFGNode(SCFGNode::ENTRY, BB, AssignET, BranchET);

    } else if (term->getNumSuccessors() > 0) {

      // Check if block is pre-header for a loop
      if (term->getNumSuccessors() == 1) {
        BasicBlock *successor = term->getSuccessor(0);
        if (Loop *L = LI->getLoopFor(successor))
          if (BB == L->getLoopPreheader())
            node = new SCFGNode(SCFGNode::LOOP_PRE_HEADER, BB, AssignET,
                                BranchET); // Preheader = all instructions are loop invariant
      }

      if (BasicBlock *predecessor = BB->getSinglePredecessor()) {
        if (Loop *L = LI->getLoopFor(predecessor))
          if (BB == L->getExitBlock()) {
            if (!node)
              node = new SCFGNode(SCFGNode::LOOP_EXIT, BB, AssignET, BranchET);
            else
              node->add_label(SCFGNode::LOOP_EXIT);
          }
      }

      if (!node)
        // Check if BB is loop related
        if (Loop *L = LI->getLoopFor(BB)) { // innermost loop
          // categorize role of BB in loop
          if (L->getHeader() == BB) // I some circumstances loop header is equal to loop body
            node = new SCFGNode(SCFGNode::LOOP_HEADER, BB, AssignET, BranchET);
          else if (L->getLoopLatch() == BB)
            node = new SCFGNode(SCFGNode::LOOP_INC, BB, AssignET, BranchET);
          //          else if (L->getExitBlock())
          //            node = new SCFGNode(SCFGNode::LOOP_EXIT, BB, ET);
          else
            // anything remaining is either part of a sub-loop, or a loop body
            node = new SCFGNode(SCFGNode::LOOP_BODY, BB, AssignET, BranchET);
        }

    } else { // Loops without successor are exit blocks
      node = new SCFGNode(SCFGNode::EXIT, BB, AssignET, BranchET);
    }

    if (nullptr == node)
      node = new SCFGNode(SCFGNode::CFG_UNKNOWN, BB, AssignET, BranchET);

    T->add_node(node);
    if (parent)
      parent->add_child(node);

    for (succ_iterator IB = succ_begin(BB), IE = succ_end(BB); IB != IE; ++IB)
      if (!recursiveTraverse(T, *IB, node, visited, LI, SE))
        return false;
  } else {
    // CFG contains backedge
    parent->add_child(T->get_node(BB));
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
      const ExpressionTree *AssignExpr = Node->getAssignmentExpression();
      const ExpressionTree *BranchExpr = Node->getBranchExpression();

      if (AssignExpr) {
        GraphWriter<const ExpressionTree *> AssignTreeWriter(O, AssignExpr, false);
        ExpressionTreeNode *AssignRoot = AssignExpr->getRoot();

        O << "\tsubgraph cluster_" << static_cast<const void *>(AssignRoot) << "{ \n";
        O << "label =\"\""
          << "\n";
        AssignTreeWriter.writeNodes();
        O << "} \n";

        // draw an edge from root node of assign expression tree to corresponding CFG node
        O << "\tNode" << static_cast<const void *>(Node) << " -> "
          << "Node" << static_cast<const void *>(AssignRoot) << " [style=dotted]"
          << "\n";
      }

      if (BranchExpr) {

        GraphWriter<const ExpressionTree *> BranchTreeWriter(O, BranchExpr, false);
        ExpressionTreeNode *BranchRoot = BranchExpr->getRoot();

        O << "\tsubgraph cluster_" << static_cast<const void *>(BranchRoot) << "{ \n";
        O << "label =\"\""
          << "\n";
        BranchTreeWriter.writeNodes();
        O << "} \n";
        // draw an edge from root node of branch tree to corresponding CFG node
        O << "\tNode" << static_cast<const void *>(Node) << " -> "
          << "Node" << static_cast<const void *>(BranchRoot) << " [style=dotted]"
          << "\n";
      }
    }
  }
};
} // end namespace llvm

namespace {

template <> struct JSONGraphTraits<const SCFG *> : public DefaultJSONGraphTraits {
  JSONGraphTraits() : DefaultJSONGraphTraits() {}
  static u_int64_t getUniqueNodeID(const SCFGNode &N) { return (u_int64_t)N.get_uid(); }

  static std::string getNodeAttributes(const SCFGNode &N, const SCFG &) {
    const ExpressionTree *T = N.getAssignmentExpression();
    std::string str = "";
    raw_string_ostream O(str);
    O << "{ ";
    O << "\"labels\": ";

    ArrayRef<SCFGNode::Label> label = N.get_labels();

    std::string label_string = "[";
    std::for_each(label.begin(), label.end(),
                  [&label_string](SCFGNode::Label label) { label_string += std::to_string(label) + ","; });
    label_string.erase(label_string.end() - 1, label_string.end());
    label_string += "]";

    O << label_string;

    if (T) {
      O << ", ";
      O << "\"assignment\": ";
      JSONGraphWriter<const ExpressionTree *> JSONWriter(O, T, false);

      JSONWriter.writeGraph("expression tree");
    }
    O << " }";
    return O.str();
  }
};
}

#endif /* CFG_HEADER_H_ */
