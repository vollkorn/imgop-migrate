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

#include "ExpressionTree.h"
#include "GraphMatching.h"
#include "SCFG.h"

using namespace llvm;

namespace {

class Optmigrate;

struct ConvolutionCheck {

  /// This enum represents the kinds of inductions that we support.
  enum InductionKind {
    IK_NoInduction,         ///< Not an induction variable.
    IK_IntInduction,        ///< Integer induction variable. Step = 1.
    IK_ReverseIntInduction, ///< Reverse int induction variable. Step = -1.
    IK_PtrInduction,        ///< Pointer induction var. Step = sizeof(elem).
    IK_ReversePtrInduction  ///< Reverse ptr indvar. Step = - sizeof(elem).
  };

  enum ConvolutionParam{
	  CP_Data_Src,
	  CP_Data_Dst,
	  CP_Coeff_Src,
	  CP_Filter_Size,
	  CP_Dimension_Sizes
  };

  Function* F;

  LoopInfo* LI;

  ScalarEvolution *SE;

  DominatorTree* DT;

  const unsigned allowed_dimensions = 2;

  const std::string bypass_iface_fcn_prefix = "convolve_bypass_hw_iface";

  ConvolutionCheck(LoopInfo* LI, ScalarEvolution *SE, DominatorTree* DT, Function* F);

  bool containsConvolution(bool bypass = false);

  /// Add bypass before original convolution
  Function *addBypass(Loop* L);

  static const SCEV *getFoldsextSCEVExpression(ScalarEvolution *SE, const SCEV *op);


private:

  SmallVector<Value* , 8> parameters;

  /// Retrieve the required input/output values for a convolution operation
  /// param[0] = input array	(iX*)
  /// param[1] = output array   (iX*)
  /// param[2] = kernel	coefficients (float*)
  /// param[3] = window size    (i32)
  /// param[4...N] = size of each dimension (i32)
  bool getRequiredParameter(Loop* L, unsigned dimensions);

  void SCEVCollectUnknowValues(SmallVector<const SCEV*, 8> unknowns);

  /// Returns the induction kind of a phi value
  InductionKind isInductionVariable(PHINode *Phi);

  Function *addUseAcceleratorPredicate(Module *m);

  LoadInst *trackbackOperandRec(Value *rhs);

  /// Returns the dimension of an array with indirectional layout
  unsigned getArrayDimension(const Instruction *I, Value **baseptr);

  /// Return pointer depth of a pointer type
  /// i.e. returns 3 for i8***
  unsigned getPointerDepth(const Type *T);


  /// Extract data source and Coefficient source from
  /// operation
  /// returns true if bouth values found, false otherwise
  bool  getMemorySources(Value* I, Value**, Value**);

  bool getMemorySink(Loop* L, Value *I, SmallPtrSet<Instruction *, 8> VisitedInsts, Value** data_dst);

  /// Returns the size of the underling data field
  /// e.g.
  /// for i...A, i+=1
  ///   for j...B, j+=1
  ///    for k...C	<-- L
  ///      for l...D
  /// it returns A and B
  bool getDataDimensionSize(Function* F, Loop* L, SmallVector<Value *, 8>& D, Value* FilterWindowSize);

  bool getFilterSizeValueFromLoop(Loop* innerLoop, Value** filtersize);


  /// Create hw interface
  ///
  /// one dimensional layout
  /// param[0] = input array	(iX*)
  /// param[1] = output array   (iX*)
  /// param[2] = kernel			(float*)
  /// param[3] = window size    (i32)
  Function *create_hw_iface0(Module* m);

  /// Create hw interface
  ///
  /// two dimensional, indirectional layout
  /// param[0] = input array	(iX**)
  /// param[1] = output array   (iX**)
  /// param[2] = kernel			(float*)
  /// param[3] = window size    (i32)
  Function *create_hw_iface1(Module *m);

  /// Returns true if all parameters of the convulution operation
  /// are available
  bool valid();
};
} // end namespace

namespace {

class Optmigrate : public FunctionPass {
public:
  static char ID; // Pass identification, replacement for typeid

  Optmigrate() : FunctionPass(ID) {}
  virtual ~Optmigrate() {}

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

private:

  friend class ConvolutionCheck;

};
} // end namespace


// Helper functions
static void getInnermostLoops(Loop &L, SmallVectorImpl<Loop *> &V);


#endif /* OPTDETECT_INCLUDE_OPTMIGRATE_H_ */
