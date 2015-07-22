/*
 * GraphMatching.h
 *
 *  Created on: Jul 14, 2015
 *      Author: lukas
 */

#ifndef GRAPHMATCHING_H_
#define GRAPHMATCHING_H_

#include "llvm/ADT/GraphTraits.h"
#include "llvm/Support/Debug.h"

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

    O << ":" << _id;
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

  static SomeGraph *createSomeGraph2(bool subgraph) {

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

      b->successors.push_back(c);

      c->successors.push_back(d);
      c->successors.push_back(f);

      d->successors.push_back(e);

      e->successors.push_back(f);

      f->successors.push_back(g);
      g->successors.push_back(h);
      g->successors.push_back(c);

    } else {

      SomeNode *_1 = new SomeNode(G, ++ID, "1");
      SomeNode *_2 = new SomeNode(G, ++ID, "2");
      SomeNode *_3 = new SomeNode(G, ++ID, "3");
      SomeNode *_4 = new SomeNode(G, ++ID, "4");

      _1->successors.push_back(_2);
      _2->successors.push_back(_3);

      _3->successors.push_back(_1);

      _3->successors.push_back(_4);
    }

    return G;
  }
  static SomeGraph *createSomeGraph1(bool subgraph) {

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

  SomeGraph *Subgraph = nullptr;

  std::map<const SomeNode *, const SomeNode *> *Assignment = nullptr;

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

} // end namespace llvm

//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------

namespace {
//TODO: methods can be static, object does not hold any state
template <typename GraphT> class GraphMatcher {

public:
  typedef GraphTraits<const GraphT *> GTraits;

  typedef typename GTraits::NodeType NodeType;
  typedef typename GTraits::nodes_iterator node_iterator;
  typedef typename GTraits::ChildIteratorType child_iterator;

  typedef typename std::pair<NodeType *, NodeType *> AssignT;
  typedef typename std::map<NodeType *, NodeType *> AssignmentT;
  typedef typename std::map<NodeType *, std::vector<NodeType *> > PAssignmentT;

  bool match_binary_trees(const GraphT *T1, const GraphT *T2, std::function<bool(NodeType *n1, NodeType *n2)> fn) {

	if(T1 == nullptr && T2 == nullptr)
		return true;
	if(T1 == nullptr || T2 == nullptr)
		return false;

    NodeType *RootT1 = GTraits::getEntryNode(T1);
    NodeType *RootT2 = GTraits::getEntryNode(T2);

    return backtrack_binary_tree(RootT1, RootT2, fn);
  }

  bool find_isomorphisms(const GraphT *G, const GraphT *H, std::vector<AssignmentT *> &assignments) {
    raw_ostream &O = dbgs();

    O << "Calculating graph isomorphism...";

    PAssignmentT possible_assignments;

    calculate_possible_assignments(G, H, possible_assignments);

    print_possible_assignment(dbgs(), possible_assignments);
    bool found_assignment = true;

    while (found_assignment) {

      found_assignment = false;

      AssignmentT *A = new AssignmentT();

      if (backtrack(G, H, possible_assignments, *A)) {
        assignments.push_back(A);

        // remove calculated assignment from possible assignments
        // Y -> X
        for (auto I = A->begin(), E = A->end(); I != E; ++I) {
          NodeType *Y = (*I).first;
          NodeType *X = (*I).second;

          std::vector<NodeType *> &candidates = possible_assignments[Y];

          auto it = std::find(candidates.begin(), candidates.end(), X);

          candidates.erase(it);
        }

        found_assignment = true;
      } else
        delete A;
    }

    if (!assignments.empty()) {

      O << "done. Found isomorphism!\n";
      return true;
    }

    O << "done. Found NO isomorphism!\n";
    return false;
  }

  void print_possible_assignment(raw_ostream &O, PAssignmentT &possible_assignment) {
    O << "Possible assignments: \n";
    for (auto IB = possible_assignment.begin(), IE = possible_assignment.end(); IB != IE; ++IB) {
      NodeType *Y = (*IB).first;
      std::vector<NodeType *> C = (*IB).second;
      O << "Node ";
      Y->print(O);
      O << ": \n";
      for (NodeType *X : C) {
        O << "\t";
        X->print(O);
        O << "\n";
      }
      O << "\n";
    }
  }

  void print_assignment(raw_ostream &O, AssignmentT &assignment) {
    O << "Assignments: \n";
    for (auto IB = assignment.begin(), IE = assignment.end(); IB != IE; ++IB) {
      AssignT key_val = *IB;
      key_val.first->print(O);
      O << " -> ";
      key_val.second->print(O);
      O << "\n";
    }
  }

  void show_matching_graph(const GraphT *G, const GraphT *H, AssignmentT &assignment) {

    int FD;
    // Windows can't always handle long paths, so limit the length of the name.
    std::string N = "matching_graph";
    N = N.substr(0, std::min<std::size_t>(N.size(), 140));
    std::string Filename = createGraphFilename(N, FD);
    raw_fd_ostream O(FD, /*shouldClose=*/true);

    if (FD == -1) {
      errs() << "error opening file '" << Filename << "' for writing!\n";
      return;
    }

    GraphWriter<const GraphT *> g_writer(O, G, false);
    GraphWriter<const GraphT *> h_writer(O, H, false);

    g_writer.writeHeader("Mathing Graph");

    O << "\tsubgraph cluster_G { \n";
    O << "\tlabel =\"" << DOT::EscapeString("G") << "\"\n";
    g_writer.writeNodes();
    O << "}\n";

    O << "\tsubgraph cluster_H { \n";
    O << "\tlabel =\"" << DOT::EscapeString("Pattern") << "\"\n";
    h_writer.writeNodes();
    O << "}\n";

    // draw assignment

    for (auto it = assignment.begin(), ie = assignment.end(); it != ie; ++it) {
      AssignT A = *it;
      const void *SrcNodeID = static_cast<const void *>(A.first);
      const void *DestNodeID = static_cast<const void *>(A.second);

      O << "\tNode" << SrcNodeID << " -> "
        << "Node" << DestNodeID << " [style=dotted]"
        << "\n";
    }

    g_writer.writeFooter();

    DisplayGraph(Filename, true, GraphProgram::DOT);
    errs() << " done. \n";
  }

private:
  ///
  /// Backtrack routine implementing Ullman's graph isomorphism algorithm
  /// excluding already found assignments
  ///
  ///
  bool backtrack(const GraphT *G, const GraphT *H, PAssignmentT &possible_assignments, AssignmentT &assignment) {

    refine_assignments(possible_assignments);

    // iterate edges of subgraph
    for (node_iterator INB = H->nodes_begin(), INE = H->nodes_end(); INB != INE; ++INB) {

      NodeType *u_H = *INB;

      for (child_iterator ICB = GraphTraits<NodeType *>::child_begin(u_H),
                          ICE = GraphTraits<NodeType *>::child_end(u_H);
           ICB != ICE; ++ICB) {

        NodeType *v_H = *ICB;

        // Check if edge (A[S], A[D]) is an edge in the super-graph G
        if (assignment.find(u_H) != assignment.end() && assignment.find(v_H) != assignment.end()) {

          NodeType *&u_g = assignment[u_H]; // possible assignments of node u of H in G
          NodeType *&v_g = assignment[v_H]; // possible assignments of node v of H in G

          if (!is_edge(u_g, v_g))
            return false;
        }
      }
    }

    // Check if all vertices are assigned
    bool allassigned = true;
    for (node_iterator IHB = H->nodes_begin(), IHE = H->nodes_end(); IHB != IHE; ++IHB) {

      if (assignment.find((*IHB)) == assignment.end())
        allassigned = false;
    }

    if (allassigned)
      return true;

    for (node_iterator IHB = H->nodes_begin(), IHE = H->nodes_end(); IHB != IHE; ++IHB) {
      NodeType *Y = (*IHB);
      std::vector<NodeType *> C = possible_assignments[Y];
      if (C.empty())
        return false;

      if (assignment.find(Y) == assignment.end()) {
        for (NodeType *X : C) {

          // avoid assigning one node from H to multiple nodes of G
          auto iter = std::find_if(assignment.begin(), assignment.end(),
                                   [&](std::pair<NodeType *const, NodeType *> & n)->bool { return n.second == X; });

          if (assignment.end() == iter) {

            // create new assignment
            auto iter = assignment.insert(std::make_pair(Y, X)).first;

            PAssignmentT new_possible_assignment = possible_assignments;
            std::vector<NodeType *> &C = new_possible_assignment.at(Y);
            C.clear();
            C.push_back(X);

            if (backtrack(G, H, new_possible_assignment, assignment))
              return true;

            assignment.erase(iter);
          }
        }
      }
      // pick an assignment and remove all but one from this assignment
    }

    return false;
  }

  void calculate_possible_assignments(const GraphT *G, const GraphT *H, PAssignmentT &possible_assignments) {

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
  std::vector<NodeType *> get_possible_assignments(const GraphT *G, const GraphT *H, NodeType *N) {

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
  std::pair<unsigned, unsigned> get_node_degrees(const GraphT *G, NodeType *N) {
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

  void refine_assignments(PAssignmentT &Assignments) {

    bool changes = true;
    while (changes) {

      changes = false;

      PAssignmentT new_possible_assignment = Assignments;

      for (auto IB = Assignments.begin(); IB != Assignments.end(); ++IB) {

        NodeType *Y = (*IB).first;
        std::vector<NodeType *> C = (*IB).second;
        bool updated_assignments = false;
        for (auto ICXB = C.begin(); ICXB != C.end();) {

          NodeType *X = *ICXB;

          auto IChildsYB = GraphTraits<NodeType *>::child_begin(Y);
          auto IChildsYE = GraphTraits<NodeType *>::child_end(Y);

          bool match = (IChildsYB == IChildsYE) ? true : false;

          for (; IChildsYB != IChildsYE; ++IChildsYB) { // Iterating neighbors of Y

            NodeType *N_y = *IChildsYB;

            std::vector<NodeType *> &assignments_N = Assignments[N_y];
            for (child_iterator IChildsXB = GraphTraits<NodeType *>::child_begin(X),
                                IChildsXE = GraphTraits<NodeType *>::child_end(X);
                 IChildsXB != IChildsXE; ++IChildsXB) {

              NodeType *N_x = *IChildsXB;

              if (std::find(assignments_N.begin(), assignments_N.end(), N_x) !=
                  assignments_N.end()) // has at least one candidate
                match = true;

            } // end iterating childs of X
          }   // end iterating childs of Y

          if (!match) {
            // remove X from possible assignments of C
            ICXB = C.erase(ICXB);
            updated_assignments = true;
          } else
            ++ICXB;
        } // end iterating candidates of X

        changes |= updated_assignments;
        if (updated_assignments) {
          // update possible assignments
          new_possible_assignment.erase(Y);
          new_possible_assignment.insert(std::make_pair(Y, C));
          //          {
          //            dbgs() << "\n------------------------\n";
          //            dbgs() << "Updating assignment:\n";
          //            Y->print(dbgs());
          //            dbgs() << "\n";
          //            for (auto f : C) {
          //              dbgs() << "\t";
          //              f->print(dbgs());
          //              dbgs() << "\n";
          //            }
          //            dbgs() << "\n------------------------\n";
          //          }
        }
      } // end loop possible assignments

      if (changes)
        Assignments = new_possible_assignment;

    } // end while
  }
  bool is_edge(NodeType *&u, NodeType *&v) {

    for (child_iterator I = GraphTraits<NodeType *>::child_begin(u), E = GraphTraits<NodeType *>::child_end(u); I != E;
         ++I)
      if (*I == v)
        return true;

    return false;
  }


  bool backtrack_binary_tree(NodeType *lhs, NodeType *rhs, std::function<bool(NodeType *n1, NodeType *n2)> fn) {

    if (nullptr == lhs || nullptr == rhs)
      return false;

    if (!fn(lhs, rhs))
      return false;

    // nodes have to have an equal amount of children
    if (std::distance(GraphTraits<NodeType *>::child_begin(lhs), GraphTraits<NodeType *>::child_end(lhs)) !=
        std::distance(GraphTraits<NodeType *>::child_begin(rhs), GraphTraits<NodeType *>::child_end(rhs)))
      return false;

    for (auto ILB = GraphTraits<NodeType *>::child_begin(lhs), ILE = GraphTraits<NodeType *>::child_end(lhs),
              IRB = GraphTraits<NodeType *>::child_begin(rhs), IRE = GraphTraits<NodeType *>::child_end(rhs);
         ILB != ILE; ++ILB, ++IRB) {

      NodeType *newLhs = *ILB;
      NodeType *newRhs = *IRB;

      return backtrack_binary_tree(newLhs, newRhs, fn);
    }

    return false;
  }

public:
  static void test_() {

    SomeGraph *G = SomeGraph::createSomeGraph2(false);
    SomeGraph *H = SomeGraph::createSomeGraph2(true);

    G->Subgraph = H;

    //    llvm::ViewGraph<SomeGraph *>(H, "Graph_H", false, "Graph H");

    raw_ostream &O = dbgs();

    GraphMatcher<SomeGraph> M;
    std::vector<AssignmentT *> assignments;
    if (M.find_isomorphisms(G, H, assignments)) {

      O << "Found an subgraph isomorphisms of G in H!\n";

      for (auto assignment : assignments) {
        M.print_assignment(O, *assignment);
        G->Assignment = assignment;
        llvm::ViewGraph<SomeGraph *>(G, "Graph_G", false, "Graph G");
      }
    }
  }
};

} // end anonymous namespace

namespace llvm {

template <> struct DOTGraphTraits<SomeGraph *> : public DefaultDOTGraphTraits {

  DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

  static std::string getGraphName(const SomeGraph *T) { return "foo graph"; }

  std::string getNodeLabel(const SomeNode *Node, const SomeGraph *Graph) {

    std::string lbl;
    raw_string_ostream _strstream(lbl);
    Node->print(_strstream);
    return lbl;
  }

  static void addCustomGraphFeatures(const SomeGraph *G, GraphWriter<SomeGraph *> &writer) {
    if (!G->Subgraph)
      return;

    raw_ostream &O = writer.getOStream();

    SomeGraph *H = G->Subgraph;
    GraphWriter<SomeGraph *> SubgraphWriter(O, H, false);
    GraphMatcher<SomeGraph>::AssignmentT *Assignment = G->Assignment;

    if (!Assignment)
      return;

    for (SomeGraph::const_iterator NB = H->nodes_begin(), NE = H->nodes_end(); NB != NE; ++NB) {

      SomeNode *Node = *NB;

      O << "\tsubgraph cluster_subgraph"
           "{ \n";
      O << "label =\"\""
        << "\n";
      SubgraphWriter.writeNode(*Node);
      O << "} \n";

      const SomeNode *mappednode = Assignment->at(Node);

      // draw an edge from root node of expression tree to corresponding CFG node
      O << "\tNode" << static_cast<const void *>(Node) << " -> "
        << "Node" << static_cast<const void *>(mappednode) << " [style=dotted]"
        << "\n";
    }
  }
};
}

#endif /* GRAPHMATCHING_H_ */
