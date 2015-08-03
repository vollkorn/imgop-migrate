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
#include "Expression.h"
#include "GraphMatching.h"

#include "jsoncons/json.hpp"

#include <set>

using namespace llvm;

using jsoncons::json;

namespace optmig {

class Pattern : public ilist_node<Pattern> {

private:
  Pattern(const std::string name, Function *F, const AbstractCFG *cfg) : name(name), F(F), H(cfg) {}

  Function *F = nullptr;

  std::vector<u_int64_t> binding;

  const AbstractCFG *H;
  std::string name;

public:
  static Pattern *createFromFile(const std::string &filename);
  static Pattern *createFromObj(const json &pattern, ScalarEvolution *SE);

  const AbstractCFG *getCFG() { return H; }

  Function* get_function(){ return F; }

  std::vector<u_int64_t>& get_binding(){ return binding;}

  void view() {

    llvm::ViewGraph<const AbstractCFG *>(getCFG(), "foo", false, "Pattern control flow graph of " + F->getName());
  }

  virtual ~Pattern() {

	  delete H;
	  delete F;
  }
};
}

namespace optmig {
class MatchResult {

private:
  std::map<Expression *, GraphMatcher<Expression>::AssignmentT> ExpressionMapping;
  GraphMatcher<AbstractCFG>::AssignmentT *CFGMapping;

  Pattern* P;

public:
  MatchResult(Pattern* P, GraphMatcher<AbstractCFG>::AssignmentT *CFGMapping,
              std::map<Expression *, GraphMatcher<Expression>::AssignmentT> ExpressionMapping)
      : P(P), CFGMapping(CFGMapping), ExpressionMapping(ExpressionMapping) {}
  virtual ~MatchResult() {}

  bool try_offload(RegionInfo* RI);


private:

  bool resolve_binding(SmallVector<Value *, 8> &value_binding);

};
}
namespace optmig {

class PatternDB {

  friend class Pattern;

public:
  static PatternDB &load(const std::string &filename, ScalarEvolution *SE);

  std::vector<MatchResult> find_matchings(const AbstractCFG *G);

  static bool CFGNarrow(const AbstractCFGNode * n_H, const AbstractCFGNode * n_G);

private:
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
