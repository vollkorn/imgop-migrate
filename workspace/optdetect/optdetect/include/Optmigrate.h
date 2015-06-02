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

#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Casting.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/ScalarEvolutionNormalization.h"

#include "llvm/Transforms/Utils/SimplifyIndVar.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/SimplifyIndVar.h"

#include "llvm/Transforms/Utils/SSAUpdater.h"
#include "llvm/Transforms/Scalar.h"

#include "llvm/IR/IRBuilder.h"

using namespace llvm;

namespace {

struct ConvolutionCheck {

  /// This enum represents the kinds of inductions that we support.
  enum InductionKind {
    IK_NoInduction,         ///< Not an induction variable.
    IK_IntInduction,        ///< Integer induction variable. Step = 1.
    IK_ReverseIntInduction, ///< Reverse int induction variable. Step = -1.
    IK_PtrInduction,        ///< Pointer induction var. Step = sizeof(elem).
    IK_ReversePtrInduction  ///< Reverse ptr indvar. Step = - sizeof(elem).
  };

  enum MemLayoutKind {
    MEM_LAYOUT_UNKNOW,
    MEM_LAYOUT_INDIRECTION, ///< Memory layout is an indirection vector
    MEM_LAYOUT_ROW_MAJOR,   ///< Memory layout is in row-major order
    MEM_LAYOUT_COL_MAJOR    ///< Memory layout is in column major order
  };

  Loop *L;
  ScalarEvolution *SE;

  //
  ConvolutionCheck(Loop *L, ScalarEvolution *SE);

  bool isConvolution();

  unsigned isIndirectionArrayAccess(const LoadInst *instr, Value **baseptr);

  unsigned getPointerDepth(const Type *T);

  LoadInst *trackbackOperandRec(Value *rhs);

  InductionKind isInductionVariable(PHINode *Phi);

  Function *addUseAcceleratorPredicate(Function &F);

  Value* getWindowSizeValue();

  static const SCEV* getFoldsextSCEVExpression(ScalarEvolution* SE, const SCEV* op);
};
} // end namespace

namespace {

class Optdetect : public FunctionPass {
public:
  static char ID; // Pass identification, replacement for typeid

  LoopInfo *LI = nullptr;
  DominatorTree *DT = nullptr;
  ScalarEvolution *SE = nullptr;
  Optdetect() : FunctionPass(ID) {}
  virtual ~Optdetect() {}

  virtual void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<TargetTransformInfo>();
    AU.addRequired<AssumptionCacheTracker>();

    AU.addRequired<DominatorTreeWrapperPass>();
    AU.addPreserved<DominatorTreeWrapperPass>();

    AU.addRequired<ScalarEvolution>();
    AU.addPreserved<ScalarEvolution>();

    AU.addRequired<LoopInfo>();
    AU.addPreserved<LoopInfo>();
    AU.addRequiredID(LoopSimplifyID);
    AU.addPreservedID(LoopSimplifyID);
    AU.addRequiredID(LCSSAID);
    AU.addPreservedID(LCSSAID);
  }

  bool runOnFunction(Function &F) override;

  void print(raw_ostream &O, const Module *M) const override;

  void getInnermostLoops(Loop &L, SmallVectorImpl<Loop *> &V);
};

} // end namespace

#endif /* OPTDETECT_INCLUDE_OPTMIGRATE_H_ */
