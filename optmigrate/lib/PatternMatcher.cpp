/*
 * PatternMatcher.cpp
 *
 *  Created on: Aug 17, 2015
 *      Author: lukas
 */

#include "PatternMatcher.h"

#include "llvm/IR/Module.h"
#include "llvm/Support/TimeValue.h"

#include "Pattern.h"
#include "Expression.h"

#include <algorithm>

using namespace optmig;

PatternMatcher::PatternMatcher(const AbstractCFG *G, Pattern *P, bool show_matching, bool cfg_only)
    : G(G), P(P), show_matching(show_matching), match_cfg_only(cfg_only) {

  H = P->getCFG();
}

PatternMatcher::~PatternMatcher() {}

bool PatternMatcher::match() {

  raw_ostream &O = dbgs();

  O << "Matching against pattern " << P->get_function()->getName() << "\n";

  std::vector<GraphMatcher<AbstractCFG>::AssignmentT *> assignments;
  if (!match_control_flow(assignments))
    return false;

  if (match_cfg_only) {
    for (auto it = assignments.begin(); it != assignments.end(); ++it) {
      GraphMatcher<AbstractCFG>::AssignmentT *assignment = *it;
      GraphMatcher<AbstractCFG>::show_matching_graph(G, H, assignment);
      GraphMatcher<AbstractCFG>::print_assignment(dbgs(), assignment);
    }
    return false;
  }
  if (!match_expressions(assignments))
    return false;
  return true;
}

bool PatternMatcher::match_control_flow(std::vector<GraphMatcher<AbstractCFG>::AssignmentT *> &A) {

  // Forward to next pattern if number of nodes in H is greater
  // than number of node in G -> no isomorphism possible
  if (std::distance(G->nodes_begin(), G->nodes_end()) < std::distance(H->nodes_begin(), H->nodes_end()))
    return false;
  GraphMatcher<AbstractCFG> foo;
  if (!foo.find_isomorphisms(G, H, A, &PatternDB::CFGNarrow))
    return false;

  return true;
}

// For each assignment in the CFG try to match the expressions
// of each block of the pattern to a block of the candidate
// If no mapping of the pattern expressions can be established
// the assignment is invalid
bool
PatternMatcher::match_assignment(GraphMatcher<AbstractCFG>::AssignmentT &A,
                                 std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &ExpressionMappings) {

  for (auto it_nodes = A.begin(), end = A.end(); it_nodes != end; ++it_nodes) {

    const std::vector<Expression *> &PatternExpressions = ((*it_nodes).first)->get_expressions();
    const std::vector<Expression *> &CandidateExpressions = ((*it_nodes).second)->get_expressions();

    if (PatternExpressions.size() != CandidateExpressions.size())
      return false;

    for (int i = 0; i < PatternExpressions.size(); ++i) {
      Expression *ExprPattern = PatternExpressions[i];
      Expression *ExprCandidate = CandidateExpressions[i];

      GraphMatcher<Expression>::AssignmentT &mapping = ExpressionMappings[ExprPattern];
      if (!GraphMatcher<Expression>::match_binary_trees(ExprPattern, ExprCandidate, mapping))
        return false;
      if (show_matching)
        GraphMatcher<Expression>::show_matching_graph(ExprPattern, ExprCandidate, mapping);
    }
  }

  if (!validate_induction_variables(ExpressionMappings))
    return false;

  return true;
}

bool PatternMatcher::match_expressions(std::vector<GraphMatcher<AbstractCFG>::AssignmentT *> &A) {

  raw_ostream &O = dbgs();

  O << "Matching expressions...\n";

  sys::TimeValue start = sys::TimeValue::now();

  // Sort out invalid control flow matchings
  for (auto it = A.begin(); it != A.end();) {

    GraphMatcher<AbstractCFG>::AssignmentT *assignment = *it;

    // Maps from expressions of the pattern to expressions
    // in the candidate
    std::map<Expression *, GraphMatcher<Expression>::AssignmentT> ExprMappings;

    if (match_assignment(*assignment, ExprMappings)) {
      ++it;
      if (show_matching) {
        GraphMatcher<AbstractCFG>::show_matching_graph(G, H, assignment);
        GraphMatcher<AbstractCFG>::print_assignment(dbgs(), assignment);
      }
      matchings.push_back({ P, assignment, ExprMappings });
    } else {
      it = A.erase(it);
      delete assignment;
    }
  }

  sys::TimeValue stop = sys::TimeValue::now();

  O << "Done. Took " << (stop - start).milliseconds() << " ms.\n";

  return !matchings.empty();
}

bool PatternMatcher::validate_induction_variables(std::map<Expression *, GraphMatcher<Expression>::AssignmentT> &A) {

  bool valid = true;

  if (A.empty())
    return false;

  for (auto itA = A.begin(), endA = A.end(); itA != endA; ++itA) {
    auto matchings = (*itA).second;
    for (auto it = matchings.begin(), end = matchings.end(); it != end; ++it) {

      const ExpressionNode *lhs = (*it).first;
      const ExpressionNode *rhs = (*it).second;

      // In case of phi nodes, check if they have equal induction
      // structure
      if (lhs->isInstanceOf(Instruction::PHI) && rhs->isInstanceOf(Instruction::PHI)) {

        const InductionDescription *ivlhs = lhs->getInductionDescription();
        const InductionDescription *ivrhs = rhs->getInductionDescription();

        if (!ivlhs != !ivrhs) // logical xor
          return false;

        if (ivlhs) {
          valid &= ivlhs->map_to(ivrhs, A);
        }
      }
    }
  }

  return valid;
}

bool MatchResult::resolve_binding(std::vector<Value *> &value_binding) {

  std::map<Value *, uint64_t> &binding = P->get_binding();

  value_binding.resize(binding.size());

  std::vector<Value *> all;
  std::vector<Value *> bound;
  // rhs value from pattern
  // lhs value from candidate
  for (auto it_binding = binding.begin(), end_binding = binding.end(); it_binding != end_binding; ++it_binding) {
    Value *rhs = (*it_binding).first;
    all.push_back(rhs);
    u_int8_t pos = (*it_binding).second;
    for (auto it = ExpressionMapping.begin(), end = ExpressionMapping.end(); it != end; ++it) {
      Expression *EP = (*it).first;
      Value *cval = nullptr;

      GraphMatcher<Expression>::AssignmentT &assignment = (*it).second;

      auto i = std::find_if(assignment.begin(), assignment.end(),
                            [&rhs](GraphMatcher<Expression>::AssignT a) { return a.first->getValue() == rhs; });

      if (i != assignment.end()) {
        // get assigned candidate node
        const ExpressionNode *cnode = assignment[(*i).first];
        cval = cnode->getValue();
      }

      if (cval) {
        bound.push_back((rhs));
        value_binding[pos] = cval;
        break;
      }
    }
  }
  if (all.size() > bound.size()) {
    errs() << "Some arguments could not be bound!\n";
    errs() << "#Unbound = " << (all.size() - bound.size()) << "\n";
    std::sort(all.begin(), all.end());
    std::sort(bound.begin(), bound.end());
    for (int i = 0; i < all.size(); ++i) {

      if (std::find(bound.begin(), bound.end(), all[i]) == bound.end())
        errs() << "Value unbound: " << all[i]->getName() << "\n";
    }

    return false;
  }

  return true;
}

bool MatchResult::try_offload() {

  BasicBlock *Entry, *Exit;

  // Lambda to get BB from candidate CFG
  auto get_bb = [&](AbstractCFGNode::Label label)->BasicBlock * {
    auto it = std::find_if(
        CFGMapping->begin(), CFGMapping->end(),
        [&label](std::pair<const AbstractCFGNode *, const AbstractCFGNode *> n) { return n.first->instanceof(label); });

    if (it != CFGMapping->end())
      return (*it).second->getBasicBlock();

    return nullptr;
  };

  Entry = get_bb(AbstractCFGNode::ENTRY);
  Exit = get_bb(AbstractCFGNode::EXIT);
  if (!Entry && !Exit)
    return false;

  assert(Entry->getParent() == Exit->getParent() && "Entry and Exit don't have the same parent!");

  LLVMContext &context = Entry->getContext();

  std::vector<Value *> binding;
  if (!resolve_binding(binding))
    return false;

  Function *F = Entry->getParent();
  Module *M = F->getParent();

  BasicBlock *BB = BasicBlock::Create(context, "acc_offload", F, Entry);
  BasicBlock *BBBypassExit = BasicBlock::Create(context, Exit->getName() + ".bypassexit", F, Exit);
  BBBypassExit->moveAfter(Exit);

  std::vector<BasicBlock *> predecessors;

  // Alter control flow such that each predecessor of the matched control flow
  // goes through the accelerator BB
  for (pred_iterator it = pred_begin(Entry); it != pred_end(Entry); ++it)
    predecessors.push_back(*it);

  for (BasicBlock *pred : predecessors) {
    TerminatorInst *term = pred->getTerminator();

    if (BranchInst *br = dyn_cast<BranchInst>(term)) {
      for (int index = 0; index < br->getNumSuccessors(); ++index)
        if (br->getSuccessor(index) == Entry) {
          br->setSuccessor(index, BB);
          break;
        }

    } else
      errs() << "Dont know how to handle " << *term << "\n";
  }

  // Create prototype of external defined hw accelerator function
  IRBuilder<> builder(BB);
  Function *hwfunction = M->getFunction(P->get_hwiface()->getName());

  CallInst *hwcall = builder.CreateCall(hwfunction, binding);
  builder.CreateCondBr(hwcall, Entry, BBBypassExit);

  Exit->replaceSuccessorsPhiUsesWith(BBBypassExit);
  Instruction *exitBlockTermInst = Exit->getTerminator();

  exitBlockTermInst->removeFromParent();
  BBBypassExit->getInstList().push_back(exitBlockTermInst);

  builder.SetInsertPoint(Exit);
  builder.CreateBr(BBBypassExit);

  dbgs() << "Injecting off-loading code into " << F->getName() << "\n";
  F->dump();
  return true;
}
