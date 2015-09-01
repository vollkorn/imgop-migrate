//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "optmigrate"

#include "llvm/Pass.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/PredIteratorCache.h"

#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/PostOrderIterator.h"

#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/GraphWriter.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"

#include <vector>

#include "Pattern.h"

#include "Optmigrate.h"

using namespace llvm;
using namespace optmig;

static cl::opt<bool> show_graphs("show-graphs", cl::init(false), cl::Hidden, cl::desc("Show all graphs"));

static cl::opt<bool> create_pattern("serialize-pattern", cl::init(false), cl::Hidden,
                                    cl::desc("Serialize each function as a pattern."));

static cl::opt<bool> match_cfg_only("match-cfg-only", cl::init(false), cl::Hidden,
                                    cl::desc("Serialize each function as a pattern."));

static cl::opt<std::string> patterdb_loc("patterndb", cl::init("./pattern.db"), cl::NotHidden,
                                         cl::desc("Path to pattern db file"));

//=---------------------------------------------------------------------

bool Optmigrate::runOnFunction(Function &F) {

  LoopInfo *LI = &getAnalysis<LoopInfo>();
  ScalarEvolution *SE = &getAnalysis<ScalarEvolution>();
  DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
  raw_ostream& O = dbgs();
  if (F.isDeclaration())
    return false;

  bool modified = false;

  Module *M = F.getParent();

  if (DT && LI && SE) {

    const AbstractCFG *G = AbstractCFG::createAbstractCFG(&F, *LI, *SE, *DT);

    if (!G) {
      errs() << "Could not create abstract control flow graph\n";
      return false;
    }
    if (show_graphs)
      llvm::ViewGraph<const AbstractCFG *>(G, "foo", false, "Abstract control flow graph of " + F.getName());

    if (!create_pattern) {
      PatternDB &db = PatternDB::load(*M, patterdb_loc.getValue());
      O.changeColor(raw_ostream::Colors::GREEN);
      dbgs() << "Checking \"" << F.getName() << "\" for matching in database...\n";
      O.resetColor();
      db.set_match_cfg_only(match_cfg_only);
      db.set_show_graphs(show_graphs);

      std::vector<MatchResult> matchings = db.find_matchings(G);

      for (MatchResult match : matchings)
        modified |= match.try_offload();

    } else {
      dbgs() << "Creating pattern from function \"" << F.getName() << "\"\n";
      AbstractCFG::serialize(G, F.getName());
    }
  }

  return modified;
}

void Optmigrate::print(raw_ostream &O, const Module *M) const {}

char Optmigrate::ID = 0;
static RegisterPass<Optmigrate> X("optmigrate", "Identify migratable operation");
