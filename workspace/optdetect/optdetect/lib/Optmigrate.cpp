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
#include "llvm/ADT/DepthFirstIterator.h"

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/ScalarEvolutionNormalization.h"
#include "llvm/Analysis/CallGraph.h"

#include "llvm/Analysis/RegionInfo.h"

#include "llvm/Transforms/Utils/SimplifyIndVar.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/SimplifyIndVar.h"

#include "llvm/Transforms/Utils/SSAUpdater.h"
#include "llvm/Transforms/Scalar.h"

#include "llvm/IR/IRBuilder.h"

#include <vector>
#include <algorithm>

#include "Pattern.h"

#include "Optmigrate.h"

using namespace llvm;
using namespace optmig;

#define DEBUG_TYPE "optmigrate"

static cl::opt<bool> EnableMMIdiomsRecognition("enable-matrix-mult-idioms", cl::init(true), cl::Hidden,
                                               cl::desc("Enable recognition of matrix multiplication idioms."));

static cl::opt<bool> EnableConvIdiomsRecognition("enable-convolution-idioms", cl::init(true), cl::Hidden,
                                                 cl::desc("Enable recognition of convolution idioms."));

static cl::opt<bool> test_graph_isomoprh("test-graph-iso", cl::init(true), cl::Hidden, cl::desc("Bla, ein schalter."));

static cl::opt<bool> view_scfg("view-scfg", cl::init(true), cl::Hidden, cl::desc("Bla, ein schalter. Foo"));

static cl::opt<bool> create_pattern("serialize-pattern", cl::init(false), cl::Hidden,
                                    cl::desc("Serialize each function as a pattern"));

//=---------------------------------------------------------------------

namespace {
// Helper class working with SCEVTraversal to figure out if a SCEV contains
// a SCEVUnknown with null value-pointer. FindInvalidSCEVUnknown::FindOne
// is set iff if find such SCEVUnknown.
//
struct SCEVTraversalCollectUnknows {

  ScalarEvolution *SE;
  SmallVector<Value *, 8> &U;
  SmallVector<Value *, 8> *E;
  SCEVTraversalCollectUnknows(ScalarEvolution *SE, SmallVector<Value *, 8> &unknowns,
                              SmallVector<Value *, 8> *exceptions = nullptr)
      : SE(SE), U(unknowns), E(exceptions) {}

  bool follow(const SCEV *S) {
    if (const SCEVUnknown *unknown = dyn_cast<SCEVUnknown>(S)) {
      if (std::find(E->begin(), E->end(), unknown->getValue()) == E->end()) // S not in exceptions
        U.push_back(unknown->getValue());
    }
    return true;
  }
  bool isDone() const { return false; }
};
}

// Folds -1 * sext iX (-1 * %foo) --> sext(%foo)
const SCEV *
ConvolutionCheck::getFoldsextSCEVExpression(ScalarEvolution *SE,
                                            const SCEV *op) { // sext iX (-1 * %foo) to iY --> -1 * sext iX (%foo) to iY
  if (const SCEVSignExtendExpr *sext = dyn_cast<SCEVSignExtendExpr>(op)) {
    const SCEV *childexpr = getFoldsextSCEVExpression(SE, sext->getOperand());

    // Childexpression is negative if  childexpr != null
    if (childexpr)
      return SE->getNegativeSCEV(SE->getSignExtendExpr(childexpr, sext->getType()));
  }

  if (const SCEVMulExpr *e = dyn_cast<SCEVMulExpr>(op)) {
    const SCEVConstant *lhs = dyn_cast<SCEVConstant>(e->getOperand(0));

    if (lhs && lhs->getValue()->isMinusOne())
      if (const SCEVUnknown *rhs = dyn_cast<SCEVUnknown>(e->getOperand(1))) {
        return rhs;
      } else if (const SCEVSignExtendExpr *rhs = dyn_cast<SCEVSignExtendExpr>(e->getOperand(1))) {
        return SE->getNegativeSCEV(getFoldsextSCEVExpression(SE, rhs));
      } else
        return nullptr;
    else
      return nullptr;
  }
  return nullptr;
}

bool ConvolutionCheck::getFilterSizeValueFromLoop(Loop *L, Value **filtersize) {

  assert(L && L->getParentLoop() && SE);

  Value *window_size = nullptr;

  const SCEV *BE = SE->getBackedgeTakenCount(L->getParentLoop());

  if (BE && isa<SCEVCouldNotCompute>(BE)) {
    errs() << "Could not compute window size\n";
    return false;
  }

  switch (BE->getSCEVType()) {
  case scUnknown: {
    const SCEVUnknown *s = cast<SCEVUnknown>(BE);
    *filtersize = s->getValue();
    return true;
  }
  case scAddExpr: {
    const SCEVAddExpr *w_scev = cast<SCEVAddExpr>(BE);
    bool simplified = false;
    // Simplify operands
    const SCEV *lhs = ConvolutionCheck::getFoldsextSCEVExpression(SE, w_scev->getOperand(0));
    if (!lhs) // Could not simplify lhs -> take original lhs
    {
      // Lhs could not be simplified.
      lhs = w_scev->getOperand(0);
    } else
      simplified = true;

    const SCEV *rhs = ConvolutionCheck::getFoldsextSCEVExpression(SE, w_scev->getOperand(1));
    if (!rhs) // Could not simplify rhs -> take original rhs
    {
      // Rhs could not be simplified
      rhs = w_scev->getOperand(1);
    } else
      simplified = true;

    if (!simplified) {
      dbgs() << "Backedge take count could not be simplified.\n";
      return false;
    }

    const SCEV *new_BE = SE->getAddExpr(lhs, rhs);
    DEBUG(dbgs() << "Expression " << *BE << " simplified to " << *new_BE << "\n");

    // Simplified has to be one of
    // C * sext iX (%foo) to iY
    // C * %foo
    // where C is constant
    if (const SCEVMulExpr *multexpr = dyn_cast<SCEVMulExpr>(new_BE))
      if (const SCEVConstant *LHConst = dyn_cast<SCEVConstant>(multexpr->getOperand(0))) {
        const SCEV *RHSC = multexpr->getOperand(1);
        if (RHSC->getSCEVType() == scUnknown)
          window_size = cast<SCEVUnknown>(RHSC)->getValue();

        // unwrap from sign extend operation
        else if (RHSC->getSCEVType() == scSignExtend) {
          const SCEVSignExtendExpr *SCEVsgn = cast<SCEVSignExtendExpr>(RHSC);

          window_size = cast<SCEVUnknown>(SCEVsgn->getOperand())->getValue();

          if (Instruction *instr = dyn_cast<Instruction>(window_size))
            switch (instr->getOpcode()) {
            case Instruction::SDiv:
            case Instruction::UDiv:
              if (instr->getNumOperands() > 1 && isa<ConstantInt>(instr->getOperand(1))) {
                ConstantInt *divisor = cast<ConstantInt>(instr->getOperand(1));
                Value *dividend = instr->getOperand(0);
                //                dbgs() << "Divisor: " << *divisor << "\n";
                //                dbgs() << "Divisor(SCEV): " << *LHConst->getValue() << "\n";

                if (divisor->getSExtValue() == LHConst->getValue()->getSExtValue()) {
                  *filtersize = dividend;
                  return true;
                }
              }
              break;
            case Instruction::FDiv: {
              dbgs() << "Non integer devision\n";
              return false;
            }
            }
        }
        return false;
      }

    break;
  }
  }
  return false;
}

ConvolutionCheck::ConvolutionCheck(LoopInfo *LI, ScalarEvolution *SE, DominatorTree *DT, Function *F)
    : LI(LI), SE(SE), DT(DT), F(F) {}

bool ConvolutionCheck::getMemorySink(Loop *L, Value *I, SmallPtrSet<Instruction *, 8> VisitedInsts, Value **data_dst) {

  Value *_data_dst = nullptr;

  DEBUG(dbgs() << "Try to retrieve memory sink\n");

  Instruction *instr;
  if (!(instr = dyn_cast<Instruction>(I)))
    return false;

  SmallVector<Instruction *, 8> Worklist;

  for (User *U : instr->users()) {
    if (PHINode *phi = dyn_cast<PHINode>(U))
      if (phi->getParent() == L->getUniqueExitBlock())
        Worklist.push_back(phi);
  }

  if (Worklist.empty())
    return false;

  while (!Worklist.empty()) {
    Instruction *Cur = Worklist.back();
    Worklist.pop_back();

    if (StoreInst *store = dyn_cast<StoreInst>(Cur)) {

      getArrayDimension(store, &_data_dst); // TODO: check array dimension
      if (_data_dst)
        *data_dst = _data_dst;
      return true;
    }

    if (Cur->user_empty())
      return false;

    for (User *U : Cur->users()) {
      Instruction *UI = cast<Instruction>(U);

      // Cross outer boundry of loop
      //      if (UI->getParent() == L->getParentLoop()->getUniqueExitBlock())
      //        dbgs() << "Outer loop boundry crossed\n";
      // Ignore feedback
      if (UI->getParent() == L->getParentLoop()->getHeader())
        continue;

      if (VisitedInsts.insert(UI).second)
        Worklist.push_back(UI);
    }
  }
  return false;
}

bool ConvolutionCheck::getMemorySources(Value *I, Value **datasrc, Value **coeffsrc) {

  Instruction *instr;
  if (!(instr = dyn_cast<Instruction>(I)) && !instr->isCommutative())
    return false;

  // Check which operand corresponds to the coefficient
  // and which operand corresponds to a pixel
  // pixel is assumed to be an integer type
  // coefficient is assumed to be a floating point type
  for (Use &u : instr->operands()) {
    Value *op = u.get();

    // Each operand has to be a derived from a memory
    LoadInst *ldinstr = trackbackOperandRec(op);
    if (!ldinstr)
      return false;

    GetElementPtrInst *ptrinstr = dyn_cast<GetElementPtrInst>(ldinstr->getPointerOperand());
    if (!ptrinstr)
      return false;

    Value *baseptr = nullptr;

    // Get array dimension
    //
    // In case of an indirectional layout (pointer-to-pointer array)
    // track back the base pointer recursively
    //
    // Layout:
    //
    // %a = getelementptr inbounds iY** %baseptr, iX dimension_n
    // %10 = load i8** %a, align 8
    // %b = getelementptr inbounds iY* %10, iX dimension_m
    // %bar = load i8* %b, align 1
    //
    unsigned arraysize = getArrayDimension(ldinstr, &baseptr);

    bool is2DLinear = false;

    // Maybe array was linearized?
    // -> Try to delinierize
    if (arraysize == 1) {
      const SCEV *idxscev = SE->getSCEV(ptrinstr);

      if (const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(idxscev)) {
        SmallVector<const SCEV *, 3> Subscripts, Sizes;

        const SCEV *ElementSize = SE->getElementSize(ldinstr);
        // Delinearize
        AR->delinearize(*SE, Subscripts, Sizes, ElementSize);

        if (Subscripts.size() == 0 || Sizes.size() == 0 || Subscripts.size() != Sizes.size()) {
          DEBUG(dbgs() << "Failed to delinearize: " << *idxscev << "\n";);
        } else {

          DEBUG({
            dbgs() << "succeeded on delinearize array access\n";
            dbgs() << "ArrayDecl[UnknownSize]";
            for (const SCEV *S : Sizes)
              dbgs() << "[" << *S << "]";

            dbgs() << "\nArrayRef";
            for (const SCEV *S : Subscripts)
              dbgs() << "[" << *S << "]";
            dbgs() << "\n";
          });

          arraysize = Subscripts.size();
          is2DLinear = (arraysize == 2);
        }
      }
    } else if (arraysize > 2) {
      errs() << "Cannot handle array size > 2\n";
      return false;
    }

    DEBUG(dbgs() << "Array size: " << arraysize << "\n");

    if (ldinstr->getType()->isFloatingPointTy()) {
      *coeffsrc = baseptr;
      DEBUG({
        dbgs() << "Coefficient source: ";
        baseptr->dump();
      });
    } else if (ldinstr->getType()->isIntegerTy()) {

      *datasrc = baseptr;
      DEBUG({
        dbgs() << "Pixel source: ";
        baseptr->dump();
      });

    } else
      return false;
  }

  return true;
}

bool ConvolutionCheck::containsConvolution(bool bypass) {

  SmallVector<Loop *, 8> Worklist;
  DenseMap<Loop *, Loop *> toplevels;
  // Check each loop starting at the highest nesting
  // level
  for (Loop *L : *LI) {
    getInnermostLoops(*L, Worklist);

    for (Loop *innermost : Worklist)
      toplevels.insert(std::make_pair(innermost, L));
  }
  // Check each loop starting at the highest nesting
  // level
  for (Loop *L : Worklist) {

    if (L->isLoopSimplifyForm() && L->isLCSSAForm(*DT)) {
      unsigned depth = L->getLoopDepth();
      if (getRequiredParameter(L, depth / 2) && bypass)
        addBypass(toplevels.lookup(L));
    }
  }

  return true;
}

bool ConvolutionCheck::getRequiredParameter(Loop *L, unsigned dimensions) {

  Value *_data_src_value = nullptr;
  Value *_data_dst_value = nullptr;
  Value *_coeff_src_value = nullptr;
  Value *_filter_size_value = nullptr;

  // Check if loop is most inner loop
  if (L->getSubLoops().size() > 0) {
    DEBUG(errs() << DEBUG_TYPE << ":"
                 << "loop is not the innermost loop\n");
    return false;
  }

  Loop *parentLoop = L->getParentLoop();

  if (!parentLoop) {
    DEBUG(errs() << DEBUG_TYPE << ":"
                 << "loop structure is not understood\n");
    return false;
  }

  // Check if outer loop has the same iteration count
  // as the inner loop
  Loop *tmp = L;
  for (unsigned i = dimensions - 1; i > 0; --i) {
    Loop *parentLoop = tmp->getParentLoop();
    const SCEV *innerBETakenCount = SE->getBackedgeTakenCount(L);
    const SCEV *outerBETakenCount = SE->getBackedgeTakenCount(parentLoop);

    if (innerBETakenCount != outerBETakenCount) {
      dbgs() << "Loops dont cover rectangular area\n";
      dbgs() << innerBETakenCount << " != " << outerBETakenCount << "\n";
      return false;
    }
    tmp = parentLoop;
  }

  // Get end block that contains the induction variable
  BasicBlock *PreHeader = L->getLoopPreheader();

  if (F->getReturnType()->getTypeID() != Type::VoidTyID) {
    DEBUG(errs() << DEBUG_TYPE << ":"
                 << "Convolution kernel has non void return type\n");
  }

  Value *ConvolveStartValue = nullptr;
  Instruction *ExitAccInstruction = nullptr;

  bool CycleComplete = false;

  for (Loop::block_iterator bb = L->block_begin(), be = L->block_end(); bb != be; ++bb)
    for (BasicBlock::iterator it = (*bb)->begin(), end = (*bb)->end(); it != end; ++it) {
      PHINode *Phi = dyn_cast<PHINode>(it);

      if (!Phi)
        continue;

      Type *PhiTy = Phi->getType();
      // Check if this node is a lcssa node
      if (!PhiTy->isIntegerTy() && !PhiTy->isFloatingPointTy() && !PhiTy->isPointerTy()) {
        dbgs() << "Optmigrate: Found an non-int non-pointer PHI.\n";
        return false;
      }

      // We only allow if-converted PHIs with exactly two incoming values.
      if (Phi->getNumIncomingValues() != 2) {
        DEBUG(dbgs() << "Found invalid PHI node.\n");
        return false;
      }

      Value *StartValue = Phi->getIncomingValueForBlock(PreHeader);

      InductionKind iKind = isInductionVariable(Phi);

      if (IK_NoInduction != iKind)
        continue;

      if (Phi->getNumIncomingValues() != 2)
        return false;

      // Reduction variables are only found in the loop header block.
      if (Phi->getParent() != L->getHeader())
        return false;

      // Receive potential convolution start value from pre header block
      Value *RdxStart = Phi->getIncomingValueForBlock(L->getLoopPreheader());
      Value *rdxinitvalue;
      Value *rdxendvalue;
      // ------------------------------------------------------------------
      // ------------------------------------------------------------------
      if (PHINode *_rdxstart = dyn_cast<PHINode>(RdxStart))
        if (_rdxstart->getParent() == parentLoop->getHeader()) {
          rdxinitvalue = _rdxstart->getIncomingValueForBlock(parentLoop->getLoopPreheader());

          // Get value from the last block before backedge was taken
          rdxendvalue = _rdxstart->getIncomingValueForBlock(parentLoop->getLoopLatch());

          // Convolution start value has to be defined as zero
          if (ConstantFP *fpstartval = dyn_cast<ConstantFP>(rdxinitvalue))
            if (!fpstartval->isZero()) {
              DEBUG(dbgs() << "Reduction does not start with zero\n");
              return false;
            }

          if (ConstantInt *intstartval = dyn_cast<ConstantInt>(rdxinitvalue))
            if (!intstartval->isZero()) {
              DEBUG(dbgs() << "Reduction does not start with zero\n");
              return false;
            }
          ConvolveStartValue = rdxinitvalue;

          // Check if exit instruction lands in a
          // store operation
          for (User *u : rdxendvalue->users()) {
            Instruction *instr = dyn_cast<Instruction>(u);

            // If user is phi instruction on exit block
            // on the outer loop, then track this value further
            if (instr && isa<PHINode>(instr) && parentLoop->getExitBlock() &&
                instr->getParent() == parentLoop->getExitBlock()) {
              PHINode *phi = cast<PHINode>(instr);
              if (phi->getNumIncomingValues() > 1)
                continue;
            }
          }

          DEBUG(dbgs() << "Convolution start value: " << *rdxinitvalue << "\n");
        }

      // ------------------------------------------------------------------
      // ------------------------------------------------------------------
      SmallPtrSet<Instruction *, 8> VisitedInstr;
      SmallVector<Instruction *, 8> Worklist;
      Worklist.push_back(Phi);
      VisitedInstr.insert(Phi);

      // Check cycle
      while (!Worklist.empty()) {
        Instruction *Cur = Worklist.pop_back_val();

        if (Cur->use_empty())
          return false;

        for (User *U : Cur->users()) {
          Instruction *instr = cast<Instruction>(U);

          // Check if instruction has an external user. In this case it is the
          // exit instruction that completes the reduction cycle
          if (!L->contains(instr->getParent()) && L->getUniqueExitBlock() == instr->getParent()) {
            unsigned opcode = Cur->getOpcode();
            // Convolution requires an additive reduction instruction
            if (opcode != Instruction::Add && opcode != Instruction::FAdd)
              continue;

            Instruction *coeffmultop = nullptr;

            // Get operand which is not the accumulated value
            // from the iteration before
            if (dyn_cast<PHINode>(Cur->getOperand(0)) == Phi)
              coeffmultop = cast<Instruction>(Cur->getOperand(1));
            else if (dyn_cast<PHINode>(Cur->getOperand(1)) == Phi)
              coeffmultop = cast<Instruction>(Cur->getOperand(0));
            else
              return false;

            if (coeffmultop->getOpcode() == Instruction::Mul || coeffmultop->getOpcode() == Instruction::FMul) {
              if (!getMemorySources(coeffmultop, &_data_src_value, &_coeff_src_value))
                return false;
            } else
              return false; // Expression not understood

            if (ExitAccInstruction != nullptr || Cur == Phi)
              return false;

            // @see Loop Vectorizer
            // The instruction used by an outside user must be the last
            // instruction
            // before we feed back to the reduction phi. Otherwise, we loose
            // VF-1 operations on the value.
            if (std::find(Phi->op_begin(), Phi->op_end(), Cur) == Phi->op_end())
              return false;

            ExitAccInstruction = Cur;

            if (!getMemorySink(L, ExitAccInstruction, VisitedInstr, &_data_dst_value)) // Get memory sink for this value
              return false;

            continue;
          }

          if (VisitedInstr.insert(instr).second)
            Worklist.push_back(instr);

          // Remember that we completed the cycle.
          if (U == Phi)
            CycleComplete = true;
        } // end iterating users
      }   // end iterating worklist
    }     // end iterating BBs/Instructions

  // Receive window size parameter from
  // loop iteration count
  if (!getFilterSizeValueFromLoop(L, &_filter_size_value))
    return false;

  SmallVector<Value *, 8> data_sizes;

  if (!getDataDimensionSize(F, L->getParentLoop(), data_sizes, _filter_size_value))
    return false;

  // Pack values together
  parameters.push_back(_data_src_value);
  parameters.push_back(_data_dst_value);
  parameters.push_back(_coeff_src_value);
  parameters.push_back(_filter_size_value);

  if (data_sizes.size())
    parameters.insert(parameters.end(), data_sizes.begin(), data_sizes.end());

  if (!CycleComplete && !ExitAccInstruction && !valid())
    return false;

  return true;
}

unsigned ConvolutionCheck::getArrayDimension(const Instruction *I, Value **baseptr) {
  const GetElementPtrInst *ptr = nullptr;
  if (isa<StoreInst>(I))
    ptr = cast<GetElementPtrInst>((cast<StoreInst>(I))->getPointerOperand());
  else if (isa<LoadInst>(I))
    ptr = cast<GetElementPtrInst>((cast<LoadInst>(I))->getPointerOperand());

  if (!ptr)
    return 0;

  // Check if operand is derived by another load
  Instruction *ldst = dyn_cast<Instruction>(ptr->getOperand(0));
  if (ldst && (isa<LoadInst>(ldst) || isa<StoreInst>(ldst)))
    return getArrayDimension(ldst, baseptr) + 1;

  *baseptr = ptr->getOperand(0);
  return 1;
}

unsigned ConvolutionCheck::getPointerDepth(const Type *T) {
  if (T->isPointerTy() && T->getNumContainedTypes())
    return getPointerDepth(T->getContainedType(0)) + 1;

  return T->isPointerTy() ? 1 : 0;
}

bool ConvolutionCheck::getDataDimensionSize(Function *F, Loop *L, SmallVector<Value *, 8> &D, Value *FilterWindowSize) {

  Value *knhalf = nullptr;
  Value *knhalf_sext = nullptr;
  unsigned users = 0;

  // TODO: make sure that there is just one division of this type (via optimization)
  for (User *U : FilterWindowSize->users()) {
    if (isa<SDivOperator>(U) || isa<UDivOperator>(U))
      if (ConstantInt *divisor = dyn_cast<ConstantInt>(U->getOperand(1))) // get divisor
        if (divisor->getValue() == 2)
          knhalf = dyn_cast<Value>(U);
  }

  if (users > 2) // only two user of kernel size allowed,
                 //%x = %div kernel_size, 2;
                 //%y = sext kernel_size to i64
    return false;

  // convolution is nested in N outer loops
  //
  // for i...A, i+=1
  //   for j...B, j+=1
  //    for k...C  <- current loop nesing
  //      for l...D

  if (L->getParentLoop()) {

    unsigned dimensions = 0;
    for (Loop *outer = L->getParentLoop(); outer != nullptr; outer = outer->getParentLoop()) {

      if (outer->getSubLoops().size() > 1) // multiple nested loops not allowed
        return false;

      const SCEVAddExpr *BEtakencount = dyn_cast<SCEVAddExpr>(SE->getBackedgeTakenCount(outer));

      if (!BEtakencount)
        return false;

      PHINode *inductionvar = nullptr;

      // Find induction variable
      for (BasicBlock::iterator it = (outer->getHeader())->begin(), end = (outer->getHeader())->end(); it != end;
           ++it) {
        PHINode *phi_ = dyn_cast<PHINode>(it);
        if (!phi_ || isInductionVariable(phi_) != InductionKind::IK_IntInduction)
          continue;

        inductionvar = phi_;
      }

      if (!inductionvar)
        return false;

      const SCEV *SV = SE->getSCEV(inductionvar);
      const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(SV);
      //      dbgs() << "Loop at depth "<< outer->getLoopDepth() << " has induction variable exit " << *AR <<"\n";

      const SCEV *ExitValue = SE->getSCEVAtScope(SV, outer->getParentLoop());
      if (!SE->isLoopInvariant(ExitValue, outer)) {
        dbgs() << "<<Unknown>>";
      } else {
        dbgs() << "Data iteration start: " << *(AR->getStart()) << "\n";
        dbgs() << "Data iteration exit value: " << *ExitValue << "\n";

        SmallVector<Value *, 8> unknowns;
        SmallVector<Value *, 8> exceptions;
        exceptions.push_back(knhalf);

        SCEVTraversalCollectUnknows visitor(SE, unknowns, &exceptions);
        visitAll(ExitValue, visitor);

        if (unknowns.size() > 1)
          return false;

        D.push_back(unknowns[0]);
      }
    }

    for (auto data_size : D)
      dbgs() << "Found data size: " << *data_size << "\n";

    if (dimensions > allowed_dimensions)
      return false;
  }
  return true;
}

// Returns the next load instruction to an operand
LoadInst *ConvolutionCheck::trackbackOperandRec(Value *rhs) {
  Instruction *instr = dyn_cast<Instruction>(rhs);

  if (!instr)
    return nullptr;

  if (LoadInst *ldinstr = dyn_cast<LoadInst>(instr))
    return ldinstr;

  unsigned opcode = instr->getOpcode();

  // Ignore type conversion from Int to Float
  // Ignore Zero/Sign extend
  if (opcode == Instruction::SIToFP || opcode == Instruction::UIToFP || opcode == Instruction::ZExt) {
    if (instr->getNumOperands() == 1)
      return trackbackOperandRec(instr->getOperand(0));
  }

  return nullptr;
}

ConvolutionCheck::InductionKind ConvolutionCheck::isInductionVariable(PHINode *Phi) {

  Type *PhiTy = Phi->getType();
  // We only handle integer and pointer inductions variables.
  if (!PhiTy->isIntegerTy() && !PhiTy->isPointerTy())
    return IK_NoInduction;

  // Check that the PHI is consecutive.
  const SCEV *PhiScev = SE->getSCEV(Phi);
  const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(PhiScev);
  if (!AR) {
    DEBUG(dbgs() << "PHI is not a poly recurrence.\n");
    return IK_NoInduction;
  }
  const SCEV *Step = AR->getStepRecurrence(*SE);

  // Integer inductions need to have a stride of one.
  if (PhiTy->isIntegerTy()) {
    if (Step->isOne())
      return IK_IntInduction;
    if (Step->isAllOnesValue())
      return IK_ReverseIntInduction;
    return IK_NoInduction;
  }

  return IK_NoInduction;
}

Function *ConvolutionCheck::addUseAcceleratorPredicate(Module *m) {
  std::string name = "convolve_hw_use_accelerator";

  // Check if "UseAccelerator" predicate is already defined
  if (Function *fcn = m->getFunction(name))
    return fcn;

  LLVMContext &modulectx = m->getContext();
  std::vector<Type *> args;
  args.push_back(Type::getInt32Ty(modulectx)); // kernel size
  args.push_back(Type::getInt32Ty(modulectx)); // size of x dimension
  args.push_back(Type::getInt32Ty(modulectx)); // size of y dimension

  FunctionType *fcnty = FunctionType::get(Type::getInt1Ty(modulectx), args, false);

  Function *fcn = Function::Create(fcnty, Function::ExternalLinkage, name, m);

  return fcn;
}

Function *ConvolutionCheck::addBypass(Loop *toplvl) {

  if (!toplvl || !valid())
    return nullptr;

  Value *_filter_size = parameters[CP_Filter_Size];
  Value *_data_src = parameters[CP_Data_Src];
  Value *_data_dst = parameters[CP_Data_Dst];
  Value *_coeff_src = parameters[CP_Coeff_Src];

  SmallVector<Value *, 8> dimension_sizes;
  for (SmallVector<Value *, 8>::iterator I = parameters.begin() + CP_Dimension_Sizes, E = parameters.end(); I != E; ++I)
    dimension_sizes.push_back(*I);

  Module *m = F->getParent();

  LLVMContext &modulectx = m->getContext();

  Function *usepredicate = addUseAcceleratorPredicate(m);

  BasicBlock *preheader = toplvl->getLoopPreheader();

  BasicBlock *BBBypassDec = BasicBlock::Create(modulectx, "bypassdesc", F, preheader);

  //	   A
  //	  / \
	//	 /   \
	//	B     C
  //
  //	   A
  //	  / \
	//	 /   \
	//	B     P
  //	     / \
	//		/   \
	//	   HW    L
  for (pred_iterator PI = pred_begin(preheader), E = pred_end(preheader); PI != E; ++PI) {
    BasicBlock *Pred = *PI;
    TerminatorInst *term = Pred->getTerminator();
    if (term) { // term may be null!
      BranchInst *branch = dyn_cast<BranchInst>(term);
      for (unsigned i = 0; i < branch->getNumSuccessors(); ++i) {
        BasicBlock *succ = branch->getSuccessor(i);
        if (succ == preheader)
          branch->setSuccessor(i, BBBypassDec);
      }
    }
  }

  // Create accelerator call site
  BasicBlock *BBBypass = BasicBlock::Create(modulectx, "acc", F);

  IRBuilder<> Builder(BBBypassDec);
  std::vector<Value *> predicateargs;
  predicateargs.push_back(_filter_size);
  for (auto dimsize : dimension_sizes)
    predicateargs.push_back(dimsize);

  // Create an upstream decision block
  CallInst *bypasscall = Builder.CreateCall(usepredicate, predicateargs, "bypass"); // name only for debugging purpose

  // Branch to bypass if predicate evaluates to true
  Builder.CreateCondBr(bypasscall, BBBypass, preheader);
  Builder.SetInsertPoint(BBBypass);
  // distinguish interface on parameter type

  std::vector<Value *> bypassargs;
  bypassargs.push_back(_data_src);
  bypassargs.push_back(_data_dst);
  bypassargs.push_back(_coeff_src);
  bypassargs.push_back(_filter_size);
  for (auto dimsize : dimension_sizes)
    bypassargs.push_back(dimsize);

  Function *bypass_iface;
  if (getPointerDepth(_data_dst->getType()) == 1)
    bypass_iface = create_hw_iface0(m);
  else if (getPointerDepth(_data_dst->getType()) == 2)
    bypass_iface = create_hw_iface1(m);

  Builder.CreateCall(bypass_iface, bypassargs);
  Builder.CreateRetVoid();

  return bypass_iface;
}

Function *ConvolutionCheck::create_hw_iface0(Module *m) {

  LLVMContext &modulectx = m->getContext();

  // Create bypass interface
  std::vector<Type *> bypassargs;
  bypassargs.push_back(Type::getInt8PtrTy(modulectx));  // Src (i8*)
  bypassargs.push_back(Type::getInt8PtrTy(modulectx));  // Dst (i8*)
  bypassargs.push_back(Type::getFloatPtrTy(modulectx)); // Kernel (float*)
  bypassargs.push_back(Type::getInt32Ty(modulectx));    // Window size (i32)

  bypassargs.push_back(Type::getInt32Ty(modulectx)); // Data size x
  bypassargs.push_back(Type::getInt32Ty(modulectx)); // Data size y

  FunctionType *fcnty = FunctionType::get(Type::getVoidTy(modulectx), bypassargs, false);
  Function *bypass_iface = nullptr;
  bypass_iface = m->getFunction(bypass_iface_fcn_prefix + "0");
  if (!bypass_iface)
    bypass_iface = Function::Create(fcnty, Function::ExternalLinkage, bypass_iface_fcn_prefix + "0", m);

  return bypass_iface;
}
Function *ConvolutionCheck::create_hw_iface1(Module *m) {
  LLVMContext &modulectx = m->getContext();

  // Create bypass interface
  std::vector<Type *> bypassargs;
  bypassargs.push_back(PointerType::get(Type::getInt8PtrTy(modulectx), 0)); // Src (i8**)
  bypassargs.push_back(PointerType::get(Type::getInt8PtrTy(modulectx), 0)); // Dst (i8**)
  bypassargs.push_back(Type::getFloatPtrTy(modulectx));                     // Kernel (float*)
  bypassargs.push_back(Type::getInt32Ty(modulectx));                        // Window size (i32)
  bypassargs.push_back(Type::getInt32Ty(modulectx));                        // Data size x
  bypassargs.push_back(Type::getInt32Ty(modulectx));                        // Data size y

  FunctionType *fcnty = FunctionType::get(Type::getVoidTy(modulectx), bypassargs, false);

  Function *bypass_iface = nullptr;
  bypass_iface = m->getFunction(bypass_iface_fcn_prefix + "1");
  if (!bypass_iface)
    bypass_iface = Function::Create(fcnty, Function::ExternalLinkage, bypass_iface_fcn_prefix + "1", m);
  return bypass_iface;
}

bool ConvolutionCheck::valid() {
  bool valid = true;

  Value *_filter_size = parameters[CP_Filter_Size];
  Value *_data_src = parameters[CP_Data_Src];
  Value *_data_dst = parameters[CP_Data_Dst];
  Value *_coeff_src = parameters[CP_Coeff_Src];
  SmallVector<Value *, 8> dimension_sizes;
  for (SmallVector<Value *, 8>::iterator I = parameters.begin() + CP_Dimension_Sizes, E = parameters.end(); I != E; ++I)
    dimension_sizes.push_back(*I);

  // all parameters available
  valid &= (_coeff_src && _filter_size && _data_src && _data_dst && dimension_sizes.size() > 0);

  if (!valid)
    return false;
  // Input/output type is the same (type is immutable)
  valid &= (_data_src->getType() == _data_dst->getType());

  return valid;
}

bool Optmigrate::runOnFunction(Function &F) {

  LoopInfo *LI = &getAnalysis<LoopInfo>();
  ScalarEvolution *SE = &getAnalysis<ScalarEvolution>();
  DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
  RegionInfo *RI = &getAnalysis<RegionInfoPass>().getRegionInfo();
  if (F.isDeclaration())
    return false;

  if (DT && LI && SE && RI) {
    if (EnableConvIdiomsRecognition) {
      dbgs() << "Checking \"" << F.getName() << "\" for convolution operation\n";
      ConvolutionCheck cv(LI, SE, DT, &F);

      cv.containsConvolution(true);
    }

    if (EnableMMIdiomsRecognition) {

      dbgs() << "Checking \"" << F.getName() << "\" for matrix-multiply-like operation\n";

      const AbstractCFG *G = AbstractCFG::createAbstractCFG(&F, *LI, *SE, *DT);

      if (!G) {
        errs() << "Could not create abstract control flow graph\n";
        return false;
      }

      if (view_scfg)
        llvm::ViewGraph<const AbstractCFG *>(G, "foo", false, "Abstract control flow graph of " + F.getName());

      if (create_pattern) {
        AbstractCFG::serialize(G, F.getName());
        return false;
      }

      PatternDB &db = PatternDB::load("pattern.db", SE);

      std::vector<MatchResult> matchings = db.find_matchings(G);

      for (MatchResult match : matchings)
        match.try_offload(RI);
    }
  }

  return false;
}

void Optmigrate::print(raw_ostream &O, const Module *M) const {}

static void getInnermostLoops(Loop &L, SmallVectorImpl<Loop *> &V) {
  if (L.empty()) // Checks if loop have nested loops
    return V.push_back(&L);

  for (Loop *inner : L)
    getInnermostLoops(*inner, V);
}

char Optmigrate::ID = 0;
static RegisterPass<Optmigrate> X("optmigrate", "Identify migratable operation");
