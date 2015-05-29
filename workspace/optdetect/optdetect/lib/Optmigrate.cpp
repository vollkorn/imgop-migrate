//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include <vector>

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

#include "Optmigrate.h"

using namespace llvm;

#define DEBUG_TYPE "optdetect"


ConvolutionCheck::ConvolutionCheck(Loop *L, ScalarEvolution *SE) : L(L), SE(SE)
{
}

bool ConvolutionCheck::isConvolution() {
  // Check if loop is most inner loop
  if (L->getSubLoops().size() > 0) {
    DEBUG(errs() << DEBUG_TYPE << ":"
                 << "loop is not the innermost loop\n");
    return false;
  }

  Loop *parent = L->getParentLoop();

  if (!parent) {
    DEBUG(errs() << DEBUG_TYPE << ":"
                 << "loop structure is not understood\n");
    return false;
  }

  // Get end block that contains the induction variable
  BasicBlock *Exit = L->getExitingBlock();
  BasicBlock *PreHeader = L->getLoopPreheader();
  BasicBlock *Header = L->getHeader();

  Value *ConvolveStartValue = nullptr;

  Value *CoefficientSrc = nullptr;
  Value *PixelSrc = nullptr;
  Value *WindowSize = nullptr;

  for (Loop::block_iterator bb = L->block_begin(), be = L->block_end(); bb != be; ++bb) {
    for (BasicBlock::iterator it = (*bb)->begin(), end = (*bb)->end(); it != end; ++it) {
      if (PHINode *Phi = dyn_cast<PHINode>(it)) {
        Type *PhiTy = Phi->getType();
        // Check if this node is a lcssa node
        if (!PhiTy->isIntegerTy() && !PhiTy->isFloatingPointTy() && !PhiTy->isPointerTy()) {
          dbgs() << "Optdetect: Found an non-int non-pointer PHI.\n";
          return false;
        }

        // We only allow if-converted PHIs with exactly two incoming values.
        if (Phi->getNumIncomingValues() != 2) {
          DEBUG(dbgs() << "Found an invalid PHI node.\n");
          return false;
        }

        Value *StartValue = Phi->getIncomingValueForBlock(PreHeader);

        InductionKind iKind = isInductionVariable(Phi);

        if (IK_NoInduction != iKind)
          continue; // TODO handle different kind of induction variables

        if (Phi->getNumIncomingValues() != 2)
          return false;

        // Reduction variables are only found in the loop header block.
        if (Phi->getParent() != L->getHeader())
          return false;

        // Receive potential convolution start value from pre header block
        Value *RdxStart = Phi->getIncomingValueForBlock(L->getLoopPreheader());
        // ------------------------------------------------------------------
        // ------------------------------------------------------------------
        if (PHINode *_rdxstart = dyn_cast<PHINode>(RdxStart))
          if (_rdxstart->getParent() == parent->getHeader()) {
            Value *rdxinitvalue = _rdxstart->getIncomingValueForBlock(parent->getLoopPreheader());

            // Convolution start value has to be defined as zero
            if (ConstantFP *fpstartval = dyn_cast<ConstantFP>(rdxinitvalue))
              if (!fpstartval->isZero())
                return false;

            if (ConstantInt *intstartval = dyn_cast<ConstantInt>(rdxinitvalue))
              if (!intstartval->isZero())
                return false;
            ConvolveStartValue = rdxinitvalue;
            errs() << "Convolution start value: " << *rdxinitvalue << "\n";
          }

        // ------------------------------------------------------------------
        // ------------------------------------------------------------------
        SmallPtrSet<Instruction *, 8> VisitedInstr;
        SmallVector<Instruction *, 8> Worklist;
        Worklist.push_back(Phi);
        VisitedInstr.insert(Phi);

        Instruction *ExitAccInstruction = nullptr;

        // Check cycle
        while (!Worklist.empty()) {
          Instruction *Cur = Worklist.pop_back_val();

          if (Cur->use_empty())
            return false;

          for (User *U : Cur->users()) {
            Instruction *instr = cast<Instruction>(U);

            // Check if instruction has an external user. In this case it is the
            // exit instruction that completes the reduction cycle
            if (!L->contains(instr->getParent())) {
              unsigned opcode = Cur->getOpcode();
              // Convolution requires an additive reduction instruction
              if (opcode != Instruction::Add && opcode != Instruction::FAdd)
                return false;

              Instruction *coeffmultop = nullptr;

              if (dyn_cast<PHINode>(Cur->getOperand(0)) == Phi)
                coeffmultop = cast<Instruction>(Cur->getOperand(1));
              else if (dyn_cast<PHINode>(Cur->getOperand(1)) == Phi)
                coeffmultop = cast<Instruction>(Cur->getOperand(0));
              else
                return false;

              if (coeffmultop->getOpcode() == Instruction::Mul || coeffmultop->getOpcode() == Instruction::FMul)
                for (Use &u : coeffmultop->operands()) {
                  Value *op = u.get();

                  LoadInst *ldinstr = trackbackOperandRec(op);
                  if (!ldinstr)
                    return false;

                  GetElementPtrInst *ptrinstr = dyn_cast<GetElementPtrInst>(ldinstr->getPointerOperand());
                  if (!ptrinstr)
                    return false;

                  Value *baseptr = nullptr;

                  // Check weather array has an indirectional layout
                  unsigned arraysize = isIndirectionArrayAccess(ldinstr, &baseptr);

                  // Maybe array was linearized, then try to delinierized
                  if (arraysize == 1) {
                    const SCEV *idxscev = SE->getSCEV(ptrinstr);

                    if (const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(idxscev)) {
                      SmallVector<const SCEV *, 3> Subscripts, Sizes;

                      const SCEV *ElementSize = SE->getElementSize(ldinstr);
                      AR->delinearize(*SE, Subscripts, Sizes, ElementSize);

                      if (Subscripts.size() == 0 || Sizes.size() == 0 || Subscripts.size() != Sizes.size()) {
                        DEBUG(dbgs() << "Failed to delinearize: " << *idxscev << "\n";);
                      } else {
                        DEBUG({
                          dbgs() << "succeeded to delinearize: " << *AR << "\n";
                          dbgs() << "ArrayDecl[UnknownSize]";
                          for (const SCEV *S : Sizes)
                            dbgs() << "[" << *S << "]";

                          dbgs() << "\nArrayRef";
                          for (const SCEV *S : Subscripts)
                            dbgs() << "[" << *S << "]";
                          dbgs() << "\n";
                        });

                        arraysize = Subscripts.size();
                      }
                    }
                  }

                  DEBUG(dbgs() << "Array size: " << arraysize << "\n");

                  if (ldinstr->getType()->isFloatingPointTy()) {
                    CoefficientSrc = baseptr;
                    DEBUG({
                      dbgs() << "Coefficient source: ";
                      baseptr->dump();
                    });

                    const SCEV *BE = SE->getBackedgeTakenCount(parent);
                    SmallVector<const SCEV *, 4> Terms;

                    if (isa<SCEVUnknown>(BE)) {
                      errs() << "Could not compute window size\n";
                      return false;
                    }

                    if (const SCEVAddExpr *BEAdd = dyn_cast<SCEVAddExpr>(BE)) {
                      //                                                   visitAll(BEAdd,)
                      for (const SCEV *op : BEAdd->operands()) {
                        dbgs() << "Type " << op->getSCEVType() << " ";
                        op->dump();
                      }
                    } else
                      return false;

                  } else if (ldinstr->getType()->isIntegerTy()) {
                    PixelSrc = baseptr;
                    DEBUG({
                      dbgs() << "Pixel source: ";
                      baseptr->dump();
                    });
                  } else
                    return false;
                }

              if (ExitAccInstruction != nullptr || Cur == Phi)
                return false;

              // @see Loop Vectorizer
              // The instruction used by an outside user must be the last
              // instruction
              // before we feed back to the reduction phi. Otherwise, we loose
              // VF-1
              // operations on the value.
              if (std::find(Phi->op_begin(), Phi->op_end(), Cur) == Phi->op_end())
                return false;

              ExitAccInstruction = Cur;
            }
            if (VisitedInstr.insert(instr).second)
              Worklist.push_back(instr);
          }
        }
      }
    }
  }

  return true;
}

unsigned ConvolutionCheck::isIndirectionArrayAccess(const LoadInst *instr, Value **baseptr) {
  GetElementPtrInst *ptrinstr = dyn_cast<GetElementPtrInst>(instr->getOperand(0));
  if (!ptrinstr)
    return 0;
  // Check if operand is derived by another load
  if (LoadInst *ldinstr = dyn_cast<LoadInst>(ptrinstr->getOperand(0)))
    return isIndirectionArrayAccess(ldinstr, baseptr) + 1;

  *baseptr = ptrinstr->getOperand(0);
  return 1;
}

unsigned ConvolutionCheck::getPointerDepth(const Type *T) {
  if (T->isPointerTy() && T->getNumContainedTypes() && T->getContainedType(0)->isPointerTy())
    return getPointerDepth(T->getContainedType(0)) + 1;

  return T->isPointerTy() ? 1 : 0;
}

// Returns the next load instruction to an operand
LoadInst *ConvolutionCheck::trackbackOperandRec(Value *rhs) {
  Instruction *instr = dyn_cast<Instruction>(rhs);

  if (!instr)
    return nullptr;

  if (LoadInst *ldinstr = dyn_cast<LoadInst>(instr))
    return ldinstr;

  unsigned opcode = instr->getOpcode();

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

Function *ConvolutionCheck::addUseAcceleratorPredicate(Function &F) {
  std::string name = "UseAccelerator";

  Module *m = F.getParent();
  // Check if "UseAccelerator" predicate is already defined
  if (Function *fcn = m->getFunction(name))
    return fcn;

  LLVMContext &modulectx = m->getContext();

  FunctionType *fcnty = FunctionType::get(Type::getInt1Ty(modulectx), false);

  Function *fcn = Function::Create(fcnty, Function::ExternalLinkage, name, m);

  // Create a new basic block to start insertion into.
  BasicBlock *BB = BasicBlock::Create(modulectx, "entry", fcn);

  IRBuilder<> Builder(BB);

  Builder.CreateRet(ConstantInt::get(IntegerType::getInt1Ty(modulectx), 1, false));

  return fcn;
}

bool Optdetect::runOnFunction(Function &F) {
  LI = &getAnalysis<LoopInfo>();
  DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
  SE = &getAnalysis<ScalarEvolution>();

  if (F.isDeclaration())
    return false;

  if (nullptr == LI)
    return false;

  DEBUG(dbgs() << "Checking for convolution in Fcn: " << F.getName() << "\n");

  SmallVector<Loop *, 8> Worklist;

  // Check each loop starting at the highest nesting
  // level
  for (Loop *L : *LI)
    getInnermostLoops(*L, Worklist);

  for (Loop *L : Worklist) {
    if (!L->isLoopSimplifyForm() && !L->isLCSSAForm(*DT))
      break; // TODO: add error report
    ConvolutionCheck cv(L, SE);

    cv.isConvolution();
    cv.addUseAcceleratorPredicate(F);
  }

  return false;
}

void Optdetect::print(raw_ostream &O, const Module *M) const {
  O << "Function pass print called: " << this->getPassName() << "\n";
}

void Optdetect::getInnermostLoops(Loop &L, SmallVectorImpl<Loop *> &V) {
  if (L.empty()) // Checks if loop have nested loops
    return V.push_back(&L);

  for (Loop *inner : L)
    getInnermostLoops(*inner, V);
}

char Optdetect::ID = 0;
static RegisterPass<Optdetect> X("optdetect", "Identify migratable operation");
