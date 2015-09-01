/*
 * PatternMatcher.h
 *
 *  Created on: Aug 17, 2015
 *      Author: lukas
 */

#ifndef PATTERNMATCHER_H_
#define PATTERNMATCHER_H_

#include "AbstractCFG.h"
#include "GraphMatching.h"

namespace optmig {
class Pattern;

class MatchResult {

private:
  std::map<Expression *, GraphMatcher<Expression>::AssignmentT> ExpressionMapping;
  GraphMatcher<AbstractCFG>::AssignmentT *CFGMapping;

  Pattern *P;

public:
  MatchResult(Pattern *P, GraphMatcher<AbstractCFG>::AssignmentT *CFGMapping,
              std::map<Expression *, GraphMatcher<Expression>::AssignmentT> ExpressionMapping)
      : P(P), CFGMapping(CFGMapping), ExpressionMapping(ExpressionMapping) {}
  virtual ~MatchResult() {}

  bool try_offload();

private:
  bool resolve_binding(std::vector<Value *> &value_binding);
};
}

namespace optmig {

class Pattern;

class PatternMatcher {

private:
  const AbstractCFG *G;
  const AbstractCFG *H;
  Pattern *P;
  bool show_matching;
  bool match_cfg_only;
  std::vector<MatchResult> matchings;

public:
  PatternMatcher(const AbstractCFG *G, Pattern *P, bool show_matching = false,  bool cfg_only = false);
  virtual ~PatternMatcher();

  bool match();

  std::vector<MatchResult> &get_matching_result() {
    return matchings;
  };

private:
  bool match_control_flow(std::vector<GraphMatcher<AbstractCFG>::AssignmentT *> &);

  bool match_expressions(std::vector<GraphMatcher<AbstractCFG>::AssignmentT *> &);

  bool validate_induction_variables(std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &);

  bool match_assignment(GraphMatcher<AbstractCFG>::AssignmentT&, std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &);




};

} /* namespace optmig */

#endif /* PATTERNMATCHER_H_ */
