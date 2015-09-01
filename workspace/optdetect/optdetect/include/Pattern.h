/*
 * Pattern.h
 *
 *  Created on: Jul 25, 2015
 *      Author: lukas
 */

#ifndef PATTERN_H_
#define PATTERN_H_

#include "llvm/ADT/ilist_node.h"
#include "llvm/IR/Module.h"

#include "llvm/Analysis/RegionInfo.h"

#include "AbstractCFG.h"
#include "PatternMatcher.h"

#include "jsoncons/json.hpp"

#include <set>

using namespace llvm;

using jsoncons::json;

namespace optmig {

class Pattern : public ilist_node<Pattern> {

private:
  Pattern(const std::string name, Function *AccFn, const AbstractCFG *cfg, std::map<Value *, uint64_t> binding)
      : name(name), AcceleratorFcn(AccFn), H(cfg), binding(binding) {}

  Function *AcceleratorFcn;
  std::map<Value *, uint64_t> binding;

  const AbstractCFG *H;
  std::string name;

public:

  static Pattern *create_from_obj(Module &M, const json &pattern);

  const AbstractCFG *getCFG() { return H; }

  Function *get_function() { return getCFG()->get_function(); }

  Function *get_hwiface() { return AcceleratorFcn; }

  std::map<Value *, u_int64_t> &get_binding() { return binding; }

  void view() {

    llvm::ViewGraph<const AbstractCFG *>(getCFG(), "foo", false,
                                         "Pattern control flow graph of " + get_function()->getName());
  }

  virtual ~Pattern() { delete H; }
};
}

namespace optmig {

class PatternDB {

  friend class Pattern;

public:
  static PatternDB &load(Module &M, const std::string &filename);

  std::vector<MatchResult> find_matchings(const AbstractCFG *G);

  static bool CFGNarrow(const AbstractCFGNode *n_H, const AbstractCFGNode *n_G);


  void set_match_cfg_only(bool val){ match_cfg_only = val;}
  void set_show_graphs(bool val){ show_graphs = val;}
private:

  bool match_cfg_only = false;
  bool show_graphs = false;

  PatternDB() {}
  virtual ~PatternDB() {

    for (int i = 0; i < db.size(); ++i) {
      delete db[i];
    }
  }

  bool init = false;

  PatternDB(PatternDB const &) = delete;
  void operator=(PatternDB const &) = delete;

  std::vector<Pattern *> db;
};
}

#endif /* PATTERN_H_ */
