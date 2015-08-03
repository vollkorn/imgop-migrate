/*
 * JSONGraphWriter.h
 *
 *  Created on: Jul 17, 2015
 *      Author: lukas
 */

#ifndef JSONGRAPHWRITER_H_
#define JSONGRAPHWRITER_H_

#include "llvm/ADT/GraphTraits.h"
#include "llvm/Support/GraphWriter.h"

#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"

#include "jsoncons/json.hpp"

#include <sstream>

using namespace llvm;

using jsoncons::json;
using jsoncons::pretty_printer;

namespace optmig {

struct DefaultJSONGraphTraits {

  DefaultJSONGraphTraits() {}

  /// getGraphName - Return the label for the graph as a whole.
  ///
  template <typename GraphType> static std::string getGraphName(const GraphType &) { return ""; }

  /// getGraphProperties - Return any custom properties that should be included
  /// in the top level graph
  /// return Object in JSON format:
  /// {
  ///   "some_property" : "some_value",
  ///   "foo" : 2.0
  /// }
  ///
  template <typename GraphType> static std::string getGraphProperties(const GraphType &) { return ""; }

  /// If you want to specify custom node attributes, this is the place to do so
  ///
  template <typename NodeType, typename GraphType>
  static std::string getNodeAttributes(const NodeType &, const GraphType &) {
    return "";
  }
  /// isNodeHidden - If the function returns true, the given node is not
  /// displayed in the graph.
  template <typename NodeType> static bool isNodeHidden(NodeType &) { return false; }

  template <typename NodeType> static u_int64_t getUniqueNodeID(NodeType &N) {
    return (u_int64_t) static_cast<const void *>(&N);
  }

  template <typename GraphType, typename GraphWriter>
  static void addCustomGraphFeatures(const GraphType &, GraphWriter &) {}
};


template <typename Ty>
struct JSONGraphTraits : public DefaultJSONGraphTraits {
	JSONGraphTraits () : DefaultJSONGraphTraits () {}
};


} // end anonymous namespace

namespace optmig {

template <typename GraphType> class JSONGraphWriter {

private:
  raw_ostream &O;
  const GraphType &G;

  typedef JSONGraphTraits<GraphType> JSONTraits;
  typedef GraphTraits<GraphType> GTraits;
  typedef typename GTraits::NodeType NodeType;
  typedef typename GTraits::nodes_iterator node_iterator;
  typedef typename GTraits::ChildIteratorType child_iterator;

  JSONTraits JTraits;
  unsigned level = 0;

public:
  JSONGraphWriter(raw_ostream &o, const GraphType &g, bool SN) : O(o), G(g) { JTraits = JSONTraits(); }

  void writeGraph() {
	json obj;
	obj["name"] = JTraits.getGraphName(*G);
	obj["graph"] = json::an_array;
    json& graph = obj["graph"];

    json nodes;
    json nodes_arr(json::an_array);

    json edges;
    json edges_arr(json::an_array);

    // Emit all of the nodes in the graph...
    writeNodes(nodes_arr);
    nodes["nodes"] = nodes_arr;

    writeEdges(edges_arr);
    edges["edges"] = edges_arr;

    graph.add(nodes);
    graph.add(edges);

	std::stringstream _sstream;
    _sstream << pretty_print(obj);

    O << _sstream.str();
  }

private:

  void writeHeader(const std::string &Title) {}

  void writeNodes(json &nodes) {

    for (auto NB = GTraits::nodes_begin(G), NE = GTraits::nodes_end(G); NB != NE; ++NB) {

      const NodeType *Node = *NB;

      json node;
      json labels(json::an_array);
      // Id of the node
      node["_id"] = JTraits.getUniqueNodeID(*Node);

      // Node attributes
      json attributes = json::parse_string(JTraits.getNodeAttributes(*Node, *G));

      node["attributes"] = attributes;

      nodes.add(node);
    }
  }

  void writeNode(NodeType *Node) {}

  void writeEdges(json &edges) {

    for (auto NB = GTraits::nodes_begin(G), NE = GTraits::nodes_end(G); NB != NE; ++NB) {

      const NodeType *Src = *NB;

      for (auto SB = GraphTraits<const NodeType *>::child_begin(Src), SE = GraphTraits<const NodeType *>::child_end(Src);
           SB != SE; ++SB) {
        const NodeType *Dst = *SB;
        json edge;
        writeEdge(edge, Src, Dst);
        edges.add(edge);
      }
    }
  }

  void writeEdge(json &edge, const NodeType *Src, const NodeType *Dst) {

      edge["src"] = JTraits.getUniqueNodeID(*Src);
      edge["dst"] = JTraits.getUniqueNodeID(*Dst);
  }

  bool isNodeHidden(NodeType *Node) { return JTraits.isNodeHidden(Node); }

private:
  static inline std::string jstr(const std::string &i) { return "\"" + i + "\""; }

  static inline std::string indent(unsigned i) {
    return std::string(i * 4, ' ');
  };
};

template <typename GraphType>
std::string WriteJSONGraph(const GraphType &G, const std::string &Name) {
  int FD = -1;

  SmallString<128> Filename;
  std::error_code EC = sys::fs::createTemporaryFile(Name, "json", FD, Filename);

  if (EC) {
    errs() << "Error: " << EC.message() << "\n";
    return "";
  }
  errs() << "Writing '" << Filename << "'... ";

  raw_fd_ostream O(FD, /*shouldClose=*/true);

  JSONGraphWriter<GraphType> JSONWriter(O, G, false);

  JSONWriter.writeGraph();

  O.close();

  errs() << " done. \n";

  return Filename.str();
}
}

#endif /* JSONGRAPHWRITER_H_ */
