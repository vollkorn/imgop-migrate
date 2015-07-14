/*
 * GraphMatching.h
 *
 *  Created on: Jul 14, 2015
 *      Author: lukas
 */

#ifndef GRAPHMATCHING_H_
#define GRAPHMATCHING_H_

#include "llvm/ADT/GraphTraits.h"

#include <vector>
#include <map>

namespace {

class SomeGraph;

class SomeNode {

public:
  typedef std::vector<SomeNode *>::iterator iterator;
  typedef std::vector<SomeNode *>::const_iterator const_iterator;

  inline iterator begin() { return successors.begin(); }
  inline iterator end() { return successors.end(); }

  inline const_iterator begin() const { return successors.begin(); }
  inline const_iterator end() const { return successors.end(); }

  unsigned _id = 0;
  std::string label;
  std::vector<SomeNode *> successors;

  SomeNode(SomeGraph *G, unsigned id, const std::string &label);
  virtual ~SomeNode() {};

  void print(raw_ostream &O) const {
    if (!label.empty())
      O << label;
    else
      O << _id;
  }
};

class SomeGraph {

public:
  typedef std::vector<SomeNode *>::iterator iterator;
  typedef std::vector<SomeNode *>::const_iterator const_iterator;

  inline iterator nodes_begin() { return nodes.begin(); }
  inline iterator nodes_end() { return nodes.end(); }

  inline const_iterator nodes_begin() const { return nodes.begin(); }
  inline const_iterator nodes_end() const { return nodes.end(); }

  SomeGraph() {}
  virtual ~SomeGraph() {}

  static SomeGraph *createSomeGraph(bool subgraph) {

    static unsigned ID = 0;

    SomeGraph *G = new SomeGraph;

    if (!subgraph) {
      SomeNode *a = new SomeNode(G, ++ID, "a");
      SomeNode *b = new SomeNode(G, ++ID, "b");
      SomeNode *c = new SomeNode(G, ++ID, "c");
      SomeNode *d = new SomeNode(G, ++ID, "d");
      SomeNode *e = new SomeNode(G, ++ID, "e");
      SomeNode *f = new SomeNode(G, ++ID, "f");
      SomeNode *g = new SomeNode(G, ++ID, "g");
      SomeNode *h = new SomeNode(G, ++ID, "h");

      a->successors.push_back(b);
      a->successors.push_back(c);

      b->successors.push_back(e);

      c->successors.push_back(d);
      c->successors.push_back(e);

      e->successors.push_back(f);
      e->successors.push_back(d);

      d->successors.push_back(c);
      d->successors.push_back(g);

      f->successors.push_back(h);
      g->successors.push_back(h);

    } else {

      SomeNode *_1 = new SomeNode(G, ++ID, "1");
      SomeNode *_2 = new SomeNode(G, ++ID, "2");
      SomeNode *_3 = new SomeNode(G, ++ID, "3");

      _1->successors.push_back(_2);
      _1->successors.push_back(_3);

      _2->successors.push_back(_1);

      _3->successors.push_back(_2);
    }

    return G;
  }

  std::vector<SomeNode *> nodes;
};

SomeNode::SomeNode(SomeGraph *G, unsigned id, const std::string &label = "") : label(label), _id(id) {
  G->nodes.push_back(this);
}
}
//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------

namespace llvm {

template <> struct GraphTraits<SomeNode *> {

  typedef SomeNode NodeType;
  typedef NodeType::iterator ChildIteratorType;

  static NodeType *getEntryNode(SomeNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<const SomeNode *> {
  typedef const SomeNode NodeType;
  typedef NodeType::const_iterator ChildIteratorType;

  static NodeType *getEntryNode(const SomeNode *CGN) { return CGN; }

  static inline ChildIteratorType child_begin(const NodeType *N) { return N->begin(); }
  static inline ChildIteratorType child_end(const NodeType *N) { return N->end(); }
};

template <> struct GraphTraits<SomeGraph *> : public GraphTraits<SomeNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef SomeGraph::iterator nodes_iterator;

  static NodeType *getEntryNode(SomeGraph *expr) { return *(expr->nodes_begin()); }

  static nodes_iterator nodes_begin(SomeGraph *expr) { return expr->nodes_begin(); }
  static nodes_iterator nodes_end(SomeGraph *expr) { return expr->nodes_end(); }
};

template <> struct GraphTraits<const SomeGraph *> : public GraphTraits<const SomeNode *> {

  // nodes_iterator/begin/end - Allow iteration over all nodes in the graph
  typedef SomeNode::const_iterator nodes_iterator;

  static NodeType *getEntryNode(const SomeGraph *expr) { return *(expr->nodes_begin()); }

  static nodes_iterator nodes_begin(const SomeGraph *expr) { return expr->nodes_begin(); }
  static nodes_iterator nodes_end(const SomeGraph *expr) { return expr->nodes_end(); }
};

template <> struct DOTGraphTraits<SomeGraph *> : public DefaultDOTGraphTraits {

  DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

  static std::string getGraphName(const SomeGraph *T) { return "foo graph"; }

  std::string getNodeLabel(const SomeNode *Node, const SomeGraph *Graph) {

    std::string lbl;
    raw_string_ostream _strstream(lbl);
    Node->print(_strstream);
    return lbl;
  }
};

} // end namespace llvm

//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------

namespace {

template <typename GraphT> class GraphMatcher {

public:
  typedef GraphTraits<GraphT> GTraits;

  typedef typename GTraits::NodeType NodeType;
  typedef typename GTraits::nodes_iterator node_iterator;
  typedef typename GTraits::ChildIteratorType child_iterator;

  bool find_isomorphism(const GraphT &G, const GraphT &H, std::map<NodeType *, NodeType *> &assignments) {
    raw_ostream &O = dbgs();

    O << "Calculating graph isomorphism...\n";

    std::map<NodeType *, std::vector<NodeType *> > possible_assignments;

    calculate_possible_assignments(G, H, possible_assignments);

    // print possible assignments

    O << "Possible assignments: \n";
    for (typename std::map<NodeType *, std::vector<NodeType *> >::iterator IB = possible_assignments.begin(),
                                                                           IE = possible_assignments.end();
         IB != IE; ++IB) {
      std::pair<NodeType *, std::vector<NodeType *> > key_val = *IB;

      NodeType *Y = key_val.first;
      std::vector<NodeType *> C = key_val.second;
      O << "Node ";
      Y->print(O);
      O << ": ";
      for (NodeType *X : C) {
        X->print(O);
        O << " ";
      }
      O << "\n";
    }

    if (backtrack(G, H, possible_assignments, assignments)) {
      return true;

      O << "Found isomorphism!\n";

      for (typename std::map<NodeType *, NodeType *>::iterator IB = assignments.begin(), IE = assignments.end();
           IB != IE; ++IB) {
        std::pair<NodeType *, NodeType *> key_val = *IB;
        key_val.first->print(O);
        O << " -> ";
        key_val.second->print(O);
        O << "\n";
      }
    }

    return true;
  }

private:
  bool backtrack(const GraphT &G, const GraphT &H, std::map<NodeType *, std::vector<NodeType *> > &possible_assignments,
                 std::map<NodeType *, NodeType *> &assignments) {

    // iterate edges of subgraph

    for (node_iterator INB = H->nodes_begin(), INE = H->nodes_end(); INB != INE; ++INB) {

      NodeType *u_H = *INB;

      for (child_iterator ICB = GraphTraits<NodeType *>::child_begin(u_H),
                          ICE = GraphTraits<NodeType *>::child_end(u_H);
           ICB != ICE; ++ICB) {

        NodeType *v_H = *ICB;

        // Check if edge (A[S], A[D]) is an edge in the super-graph G
        if (assignments.find(u_H) != assignments.end() && assignments.find(v_H) != assignments.end()) {

          NodeType *&u_g = assignments[u_H]; // possible assignments of node u of H in G
          NodeType *&v_g = assignments[v_H]; // possible assignments of node v of H in G

          if (!is_edge(G, u_g, v_g))
            return false;
        }
      }
    }

    for (typename std::map<NodeType *, std::vector<NodeType *> >::iterator IB = possible_assignments.begin(),
                                                                           IE = possible_assignments.end();
         IB != IE; ++IB) {
      std::pair<NodeType *, std::vector<NodeType *> > key_val = *IB;

      NodeType *Y = key_val.first;
      std::vector<NodeType *> C = key_val.second;

      for (NodeType *X : C) {
        assignments.insert(std::make_pair(Y, X));
        if (backtrack(G, H, possible_assignments, assignments))
          return true;
      }
      // pick an assignment and remove all but one from this assignment
    }

    return false;
  }

  void calculate_possible_assignments(const GraphT &G, const GraphT &H,
                                      std::map<NodeType *, std::vector<NodeType *> > &possible_assignments) {

    for (node_iterator I = H->nodes_begin(), E = H->nodes_end(); I != E; ++I) {

      NodeType *N = *I;
      std::vector<NodeType *> assignments = get_possible_assignments(G, H, N);

      possible_assignments.insert(std::make_pair(N, assignments));
    }
  }

  /// Calculate possible assignments of a node N of graph H in graph G
  ///
  /// For indirected graphs
  ///
  /// M[i][j] = 1 <=> Node i can be mapped to node j <=> deg(i) geq deg(j)
  ///
  /// For directed graphs:
  /// M[i][j] = 1 <=> deg_in(i) eq deg_in(j) and deg_out(i) eq deg_out(j)
  ///
  ///
  /// @param G Graph
  /// @param H Possible subgraph
  /// @param N Node in H
  std::vector<NodeType *> get_possible_assignments(const GraphT &G, const GraphT &H, NodeType *N) {

    std::vector<NodeType *> P;

    // in degree, out degree
    typedef std::pair<unsigned, unsigned> DegT;
    DegT deg_h = get_node_degrees(H, N);

    for (node_iterator I = G->nodes_begin(), E = G->nodes_end(); I != E; ++I) {
      NodeType *M = *I;
      DegT deg_g = get_node_degrees(G, M);

      if (deg_g >= deg_h)
        P.push_back(M);
    }

    return P;
  }

  ///
  /// Returns the input/output degree of a node N in Graph G
  ///
  std::pair<unsigned, unsigned> get_node_degrees(const GraphT &G, NodeType *N) {
    unsigned deg_in = 0, deg_out = 0;

    // get input degree
    for (child_iterator I = GraphTraits<NodeType *>::child_begin(N), E = GraphTraits<NodeType *>::child_end(N); I != E;
         ++I)
      deg_out++;

    // get output degree
    for (node_iterator I = G->nodes_begin(), E = G->nodes_end(); I != E; ++I) {
      NodeType *PP = *I; // possible predecessor

      for (child_iterator IC = GraphTraits<NodeType *>::child_begin(PP), IE = GraphTraits<NodeType *>::child_end(PP);
           IC != IE; ++IC)
        if (*IC == N)
          deg_in++;
    }

    return std::make_pair(deg_in, deg_out);
  }

  void refine_assignments(std::map<NodeType *, std::vector<NodeType *> > &Assignments) {

    bool changing = true;
    while (changing) {

      changing = false;
      for (typename std::map<NodeType *, std::vector<NodeType *> >::iterator IB = Assignments.begin(),
                                                                             IE = Assignments.end();
           IB != IE; ++IB) {
        std::pair<NodeType *, std::vector<NodeType *> > key_val = *IB;

        NodeType *Y = key_val.first;
        std::vector<NodeType *> C = key_val.second;

        for (typename std::vector<NodeType *>::iterator ICXB = C.begin(), ICXE = C.end(); ICXB != ICXE; ++ICXB) {
          NodeType *X = *ICXB;
          for (child_iterator IChildsYB = Y->child_begin(), IChildsYE = Y->child_end(); IChildsYB != IChildsYE;
               ++IChildsYB) { // Iterating neighbors of Y
            NodeType *N = *IChildsYB;
            for (child_iterator IChildsXB = X->child_begin(), IChildsXE = X->child_end(); IChildsXB != IChildsXE;
                 ++IChildsXB) {
              NodeType *M = IChildsXB;
              std::vector<NodeType *> assignments_N = Assignments[N];
              typename std::vector<NodeType *>::iterator pIter =
                  std::find(assignments_N.begin(), assignments_N.end(), M);
              if (pIter == assignments_N.end()) { // not found in neighbour candidates
                // remove X from possible assignments of C
                ICXB = C.erase(ICXB);
                changing = true;
              }
            }
          }
        }
      }
    }
  }

  bool is_edge(const GraphT &G, NodeType *&u, NodeType *&v) {

    for (child_iterator I = GraphTraits<NodeType *>::child_begin(u), E = GraphTraits<NodeType *>::child_end(u); I != E;
         ++I)
      if (*I == v)
        return true;

    return false;
  }

public:
  static void test_() {

    SomeGraph *G = SomeGraph::createSomeGraph(false);
    SomeGraph *H = SomeGraph::createSomeGraph(true);

    llvm::ViewGraph<SomeGraph *>(G, "Graph_G", false, "Graph G");
    llvm::ViewGraph<SomeGraph *>(H, "Graph_H", false, "Graph H");

    GraphMatcher<SomeGraph *> M;
    std::map<NodeType *, NodeType *> assignments;
    M.find_isomorphism(G, H, assignments);
  }
};

} // end anonymous namespace
#endif /* GRAPHMATCHING_H_ */
