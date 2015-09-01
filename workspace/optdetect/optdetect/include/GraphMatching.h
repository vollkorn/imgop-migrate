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
#include "llvm/Support/TimeValue.h"

#include <vector>
#include <map>
#include <unordered_map>
#include <functional>

//#define PROFILE

#ifdef PROFILE

#include <gperftools/profiler.h>

#endif

//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------

namespace {
template <typename GraphT> class GraphMatcher {

public:
  typedef GraphTraits<const GraphT *> GTraits;

  typedef typename GTraits::NodeType NodeType;
  typedef typename GTraits::nodes_iterator node_iterator;
  typedef typename GTraits::ChildIteratorType child_iterator;

  typedef typename std::pair<NodeType *, NodeType *> AssignT;
  typedef typename std::vector<NodeType *> CandidatesT;
  typedef typename std::unordered_map<NodeType *, NodeType *> AssignmentT;
  typedef typename std::unordered_map<NodeType *, CandidatesT> PAssignmentT;

  static bool match_binary_trees(const GraphT *T1, const GraphT *T2, AssignmentT &mapping) {

    if (T1 == nullptr && T2 == nullptr)
      return true;
    if (T1 == nullptr || T2 == nullptr)
      return false;

    NodeType *RootT1 = GTraits::getEntryNode(T1);
    NodeType *RootT2 = GTraits::getEntryNode(T2);

    return backtrack_binary_tree(RootT1, RootT2, mapping);
  }

  static bool find_isomorphisms(const GraphT *G, const GraphT *H, std::vector<AssignmentT *> &assignments,
                                std::function<bool(const NodeType *, const NodeType *)> narrowfn = [](
                                    const NodeType *n1, const NodeType *n2) { return true; }) {

#ifdef PROFILE
    ProfilerStart(__FUNCTION__);
#endif

    raw_ostream &O = dbgs();

    O << "Calculating graph isomorphism...\n";
    O << "#G: " << std::distance(GTraits::nodes_begin(G), GTraits::nodes_end(G)) << "\n";
    O << "#H: " << std::distance(GTraits::nodes_begin(H), GTraits::nodes_end(H)) << "\n";

    sys::TimeValue start = sys::TimeValue::now();

    PAssignmentT possible_assignments;

    calculate_possible_assignments(G, H, possible_assignments, narrowfn);

    // print_possible_assignment(dbgs(), possible_assignments);
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

          auto &candidates = possible_assignments[Y];

          auto it = std::find(candidates.begin(), candidates.end(), X);

          candidates.erase(it);
        }

        found_assignment = true;
      } else
        delete A;
    }

    sys::TimeValue stop = sys::TimeValue::now();

    O << "Done. Took " << (stop - start).milliseconds() << " ms\n";

#ifdef PROFILE
    ProfilerStop();
#endif

    if (!assignments.empty()) {

      O << "Found isomorphism!\n";
      return true;
    }

    O << "Found NO isomorphism!\n";
    return false;
  }

  static void print_possible_assignment(raw_ostream &O, PAssignmentT &possible_assignment) {
    O << "Possible assignments: \n";
    for (auto IB = possible_assignment.begin(), IE = possible_assignment.end(); IB != IE; ++IB) {
      NodeType *Y = (*IB).first;
      CandidatesT &C = (*IB).second;
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

  static void print_assignment(raw_ostream &O, AssignmentT &assignment) {
    O << "Assignments: \n";
    for (auto IB = assignment.begin(), IE = assignment.end(); IB != IE; ++IB) {
      AssignT key_val = *IB;
      key_val.first->print(O);
      O << " -> ";
      key_val.second->print(O);
      O << "\n";
    }
  }

  static void print_assignment(raw_ostream &O, AssignmentT *assignment) { print_assignment(O, *assignment); }

  static void show_matching_graph(const GraphT *G, const GraphT *H, AssignmentT *assignment) {
    show_matching_graph(G, H, *assignment);
  }

  static void show_matching_graph(const GraphT *G, const GraphT *H, AssignmentT &assignment) {

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
  static bool backtrack(const GraphT *G, const GraphT *H, PAssignmentT &possible_assignments, AssignmentT &assignment) {

    refine_assignments(possible_assignments);

    // iterate edges of subgraph and check if the assignment is feasible so far
    for (node_iterator INB = GTraits::nodes_begin(H), INE = GTraits::nodes_end(H); INB != INE; ++INB) {

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

    // Check if all vertices were assigned
    if (assignment.size() == std::distance(GTraits::nodes_begin(H), GTraits::nodes_end(H)))
      return true;

    for (node_iterator IHB = GTraits::nodes_begin(H), IHE = GTraits::nodes_end(H); IHB != IHE; ++IHB) {
      NodeType *Y = (*IHB);

      // Check if Y was not already assigned
      if (assignment.find(Y) != assignment.end())
        continue;

      CandidatesT &candidates = possible_assignments[Y];
      if (candidates.empty())
        return false;
      auto itc = candidates.begin();
      while(itc != candidates.end()) {
        NodeType *X = (*itc);
        // create new assignment
        auto iter = assignment.insert(std::make_pair(Y, X)).first;
        // remove X from all possible assignments except
        PAssignmentT new_possible_assignment = possible_assignments;

        if (update_possible_assignment(Y, X, new_possible_assignment) &&
            backtrack(G, H, new_possible_assignment, assignment))
          return true;

        assignment.erase(iter);

        itc = candidates.erase(itc);
        refine_assignments(possible_assignments);
      }

      // pick an assignment and remove all but one from this assignment
    }

    return false;
  }

  static bool update_possible_assignment(const NodeType *Y, const NodeType *X, PAssignmentT &P) {

    for (auto it = P.begin(), end = P.end(); it != end; ++it) {

      NodeType *const N = (*it).first;
      CandidatesT &candidates = (*it).second;

      if (N == Y) {
        candidates.clear();
        candidates.push_back(X);
      } else {

        auto pos = std::find(candidates.begin(), candidates.end(), X);
        if (pos != candidates.end()) {
          candidates.erase(pos);
        }
        if (candidates.empty())
          return false;
      }
    }
    return true;
  }

  static void calculate_possible_assignments(const GraphT *G, const GraphT *H, PAssignmentT &possible_assignments,
                                             std::function<bool(const NodeType *, const NodeType *)> narrowfn) {

    for (node_iterator I = GTraits::nodes_begin(H), E = GTraits::nodes_end(H); I != E; ++I) {

      NodeType *N = *I;
      CandidatesT assignments = get_possible_assignments(G, H, N, narrowfn);

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
  static CandidatesT get_possible_assignments(const GraphT *G, const GraphT *H, NodeType *N,
                                              std::function<bool(const NodeType *, const NodeType *)> narrowfn) {

    CandidatesT P;

    // in degree, out degree
    typedef std::pair<unsigned, unsigned> DegT;
    DegT deg_h = get_node_degrees(H, N);

    for (node_iterator I = GTraits::nodes_begin(G), E = GTraits::nodes_end(G); I != E; ++I) {
      NodeType *M = *I;
      DegT deg_g = get_node_degrees(G, M);

      if (deg_g >= deg_h && narrowfn(N, M))
        P.push_back(M);
    }

    return P;
  }

  ///
  /// Returns the input/output degree of a node N in Graph G
  ///
  static std::pair<unsigned, unsigned> get_node_degrees(const GraphT *G, NodeType *N) {
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

  static void refine_assignments(PAssignmentT &Assignments) {

    bool changes = true;
    while (changes) {

      changes = false;
      for (auto IB = Assignments.begin(), IE = Assignments.end(); IB != IE; ++IB) {

        NodeType *Y = (*IB).first;
        CandidatesT &C = (*IB).second;

        for (auto ICXB = C.begin(); ICXB != C.end();) {

          NodeType *X = *ICXB;

          auto IChildsYB = GraphTraits<NodeType *>::child_begin(Y);
          auto IChildsYE = GraphTraits<NodeType *>::child_end(Y);

          bool match = (IChildsYB == IChildsYE) ? true : false;

          for (; IChildsYB != IChildsYE; ++IChildsYB) { // Iterating neighbors of Y

            NodeType *N_y = *IChildsYB;

            CandidatesT &assignments_N = Assignments[N_y];
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
            changes = true;
            //            dbgs() << "Updating possible assignments...\n";
          } else
            ++ICXB;
        } // end iterating candidates of X

      } // end loop possible assignments
    }   // end while
  }

  static bool is_edge(NodeType *&u, NodeType *&v) {

    for (child_iterator I = GraphTraits<NodeType *>::child_begin(u), E = GraphTraits<NodeType *>::child_end(u); I != E;
         ++I)
      if (*I == v)
        return true;

    return false;
  }

  static bool backtrack_binary_tree(NodeType *lhs, NodeType *rhs, AssignmentT &mapping) {

    if (nullptr == lhs || nullptr == rhs)
      return false;

    if (lhs->maps_to(rhs))
      mapping.insert(std::make_pair(lhs, rhs));
    else
      return false;

    // nodes have to have an equal amount of children
    if (std::distance(GraphTraits<NodeType *>::child_begin(lhs), GraphTraits<NodeType *>::child_end(lhs)) !=
        std::distance(GraphTraits<NodeType *>::child_begin(rhs), GraphTraits<NodeType *>::child_end(rhs)))
      return false;

    bool children_match = true;
    for (auto ILB = GraphTraits<NodeType *>::child_begin(lhs), ILE = GraphTraits<NodeType *>::child_end(lhs),
              IRB = GraphTraits<NodeType *>::child_begin(rhs), IRE = GraphTraits<NodeType *>::child_end(rhs);
         ILB != ILE; ++ILB, ++IRB) {

      NodeType *newLhs = *ILB;
      NodeType *newRhs = *IRB;

      children_match = backtrack_binary_tree(newLhs, newRhs, mapping);
    }

    return children_match;
  }
};

} // end namespace

#endif /* GRAPHMATCHING_H_ */
