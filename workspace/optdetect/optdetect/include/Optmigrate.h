/*
 * Optmigrate.h
 *
 *  Created on: May 28, 2015
 *      Author: lukas
 */

#ifndef OPTDETECT_INCLUDE_OPTMIGRATE_H_
#define OPTDETECT_INCLUDE_OPTMIGRATE_H_

#include "llvm/Pass.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/PredIteratorCache.h"

#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/GraphTraits.h"

#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Casting.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/ScalarEvolutionNormalization.h"
#include "llvm/Analysis/RegionInfo.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/DominanceFrontier.h"

#include "llvm/Transforms/Utils/SimplifyIndVar.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/SimplifyIndVar.h"

#include "llvm/Transforms/Utils/SSAUpdater.h"
#include "llvm/Transforms/Scalar.h"

#include "llvm/IR/IRBuilder.h"

#include "AbstractCFG.h"
#include "Expression.h"
#include "GraphMatching.h"

using namespace llvm;

namespace {

class Optmigrate : public FunctionPass {
public:
  static char ID; // Pass identification, replacement for typeid

  Optmigrate() : FunctionPass(ID) {}
  virtual ~Optmigrate() {}

  virtual void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<DominatorTreeWrapperPass>();

	AU.addRequired<RegionInfoPass>();
	AU.addRequired<ScalarEvolution>();
    AU.addRequired<LoopInfo>();
  }

  bool runOnFunction(Function &F) override;

  void print(raw_ostream &O, const Module *M) const override;


};
} // end namespace

#endif /* OPTDETECT_INCLUDE_OPTMIGRATE_H_ */
