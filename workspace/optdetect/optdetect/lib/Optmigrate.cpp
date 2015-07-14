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

//namespace {
//// Helper class working with SCEVTraversal to figure out if a SCEV contains
//// a SCEVUnknown with null value-pointer. FindInvalidSCEVUnknown::FindOne
//// is set iff if find such SCEVUnknown.
////
//struct SCEVTraversalFoo {
//
//  ScalarEvolution *SE;
//  SmallVector<const SCEV *, 8> lhs;
//
//  SCEVTraversalFoo(ScalarEvolution *SE) : SE(SE) {}
//
//  bool follow(const SCEV *S) {
//    const SCEV *foo = ConvolutionCheck::getFoldsextSCEVExpression(SE, S);
//
//    S->dump();
//
//    if (foo) {
//      dbgs() << *S << " -> simplified to -> " << *foo << "\n";
//
//      dbgs() << "Lhs: " << *(lhs.pop_back_val()) << "\n";
//
//      return false;
//    }
//
//    lhs.push_back(S);
//
//    if(isa<SCEVAddExpr>(S))
//		return true;
//
//    return false;
//  }
//  bool isDone() const { return false; }
//};
//}

// Folds -1 * sext iX (-1 * %foo) --> sext(%foo)
const SCEV* ConvolutionCheck::getFoldsextSCEVExpression(ScalarEvolution* SE, const SCEV* op)
{	// sext iX (-1 * %foo) to iY --> -1 * sext iX (%foo) to iY
	if(const SCEVSignExtendExpr* sext = dyn_cast<SCEVSignExtendExpr>(op))
	{
		const SCEV* childexpr = getFoldsextSCEVExpression(SE, sext->getOperand());

		// Childexpression is negative if  childexpr != null
		if(childexpr)
			return SE->getNegativeSCEV(SE->getSignExtendExpr(childexpr, sext->getType()));
	}

	if(const SCEVMulExpr* e = dyn_cast<SCEVMulExpr>(op))
	{	const SCEVConstant* lhs =  dyn_cast<SCEVConstant>(e->getOperand(0));

		if(lhs && lhs->getValue()->isMinusOne())
			if(const SCEVUnknown* rhs =  dyn_cast<SCEVUnknown>(e->getOperand(1)))
			{
				return rhs;
			} else if (const SCEVSignExtendExpr* rhs =  dyn_cast<SCEVSignExtendExpr>(e->getOperand(1)))
			{
				return SE->getNegativeSCEV(getFoldsextSCEVExpression(SE, rhs));
			} else return nullptr;
		else
			return nullptr;
	}
	return nullptr;
}

Value *ConvolutionCheck::getWindowSizeValue() {

  assert(L && L->getParentLoop() && SE);

  Value* window_size = nullptr;

  const SCEV *BE = SE->getBackedgeTakenCount(L->getParentLoop());

  if (BE && isa<SCEVCouldNotCompute>(BE)) {
    errs() << "Could not compute window size\n";
    return nullptr;
  }

  switch (BE->getSCEVType()) {
  case scUnknown: {
    const SCEVUnknown *s = cast<SCEVUnknown>(BE);
    window_size = s->getValue();
    break;
  }
  case scAddExpr: {
    const SCEVAddExpr *w_scev = cast<SCEVAddExpr>(BE);
    bool simplified = false;
    // Simplify operands
    const SCEV *lhs = ConvolutionCheck::getFoldsextSCEVExpression(SE, w_scev->getOperand(0));
    if (!lhs) // Could not simplify lhs -> take original lhs
    {
      dbgs() << "Lhs could not be simplified\n";
      lhs = w_scev->getOperand(0);
    } else
      simplified = true;

    const SCEV *rhs = ConvolutionCheck::getFoldsextSCEVExpression(SE, w_scev->getOperand(1));
    if (!rhs) // Could not simplify rhs -> take original rhs
    {
      dbgs() << "Rhs could not be simplified\n";
      rhs = w_scev->getOperand(1);
    } else
      simplified = true;

    if (!simplified) {
      dbgs() << "Backedge take count could not be simplified.\n";
      return nullptr;
    }

    const SCEV *new_BE = SE->getAddExpr(lhs, rhs);
    dbgs() << "Expression " << *BE << " simplified to " << *new_BE << "\n";

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

          if(Instruction* instr = dyn_cast<Instruction>(window_size))
            switch (instr->getOpcode()) {
            case Instruction::SDiv:
            case Instruction::UDiv:
              if (instr->getNumOperands() > 1 && isa<ConstantInt>(instr->getOperand(1))) {
                ConstantInt *divisor = cast<ConstantInt>(instr->getOperand(1));
                Value* dividend = instr->getOperand(0);
                dbgs() << "Divisor: " << *divisor << "\n";
                dbgs() << "Divisor(SCEV): " << *LHConst->getValue() << "\n";

                if(divisor->getSExtValue() == LHConst->getValue()->getSExtValue())
                	return dividend;
              }
              break;
            case Instruction::FDiv: {
              dbgs() << "Non integer devision\n";
              return nullptr;
            }
            }
        }
        return nullptr;
      }

    break;
  }
  }
  return nullptr;
}

ConvolutionCheck::ConvolutionCheck(Loop *L, ScalarEvolution *SE) : L(L), SE(SE)
{
}

Value* ConvolutionCheck::getMemorySink(Instruction* I){

//	User
//
//	for(User* u : I->users()){
//
//	}

	return nullptr;
}

bool ConvolutionCheck::getMemorySources(Value* I){

  Instruction* instr;
  if(!(instr = dyn_cast<Instruction>(I)) && !instr->isCommutative())
	  return false;

  // Check which operand corresponds to the coefficient
  // and which operand corresponds to a pixel
  // pixel is assumed to be an integer type
  // coefficient is assumed to be a floating point type
  for (Use &u : instr) {
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
      KernelSource = baseptr;
      DEBUG({
        dbgs() << "Coefficient source: ";
        baseptr->dump();
      });
    } else if (ldinstr->getType()->isIntegerTy()) {

      PixelSource = baseptr;
      DEBUG({
        dbgs() << "Pixel source: ";
        baseptr->dump();
      });

    } else
      return false;
  }

  return true;
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

  Function* F = Header->getParent();

  if(F->getReturnType()->getTypeID() != Type::VoidTyID)
  {
	  DEBUG(errs() << DEBUG_TYPE << ":"
	                   << "Convolution kernel has non void return type\n");
  }

  Value		   *ConvolveStartValue = nullptr;
  Value		   *ConvolveEndValue   = nullptr;
  Instruction *ExitAccInstruction  = nullptr;
  bool CycleComplete = false;

  for (Loop::block_iterator bb = L->block_begin(), be = L->block_end(); bb != be; ++bb)
    for (BasicBlock::iterator it = (*bb)->begin(), end = (*bb)->end(); it != end; ++it) {
      PHINode *Phi = dyn_cast<PHINode>(it);

      if (!Phi)
        continue;

      Type *PhiTy = Phi->getType();
      // Check if this node is a lcssa node
      if (!PhiTy->isIntegerTy() && !PhiTy->isFloatingPointTy() && !PhiTy->isPointerTy()) {
        dbgs() << "Optdetect: Found an non-int non-pointer PHI.\n";
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
        if (_rdxstart->getParent() == parent->getHeader()) {
          rdxinitvalue = _rdxstart->getIncomingValueForBlock(parent->getLoopPreheader());

          // Get value from the last block before backedge was taken
          rdxendvalue  = _rdxstart->getIncomingValueForBlock(parent->getLoopLatch());

          // Convolution start value has to be defined as zero
          if (ConstantFP *fpstartval = dyn_cast<ConstantFP>(rdxinitvalue))
            if (!fpstartval->isZero())
              return false;

          if (ConstantInt *intstartval = dyn_cast<ConstantInt>(rdxinitvalue))
            if (!intstartval->isZero())
              return false;

          ConvolveStartValue = rdxinitvalue;

          // Check if exit instruction lands in a
          // store operation
          for (User *u : rdxendvalue->users()) {
            Instruction *instr = dyn_cast<Instruction>(u);

            // If user is phi instruction on exit block
            // on the outer loop, then track this value further
            if (instr && isa<PHINode>(instr) &&
                parent->getExitBlock() &&
				instr->getParent() == parent->getExitBlock()) {
              PHINode *phi = cast<PHINode>(instr);
              if (phi->getNumIncomingValues() > 1)
                continue;
            }
          }

          errs() << "Convolution start value: " << *rdxinitvalue << "\n";
        }

      // ------------------------------------------------------------------
      // ------------------------------------------------------------------

      // Check if outer loop has the same iteration count
      // as the inner loop
      const SCEV *innerBETakenCount = SE->getBackedgeTakenCount(L);
      const SCEV *outerBETakenCount = SE->getBackedgeTakenCount(parent);

      if (innerBETakenCount != outerBETakenCount) {
        dbgs() << "Loops does not cover rectangular area\n";
        dbgs() << innerBETakenCount << " != " << outerBETakenCount << "\n";
        return false;
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
        dbgs() << "Worklist cur is: ";
        Cur->dump();

        if (Cur->use_empty())
          return false;

        for (User *U : Cur->users()) {
          Instruction *instr = cast<Instruction>(U);

          // Check if instruction has an external user. In this case it is the
          // exit instruction that completes the reduction cycle
          if (!L->contains(instr->getParent()) && L->getUniqueExitBlock() == instr->getParent()) {
            unsigned opcode = Cur->getOpcode();
            dbgs() << "External use: ";
            instr->dump();

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

            if (coeffmultop->getOpcode() == Instruction::Mul || coeffmultop->getOpcode() == Instruction::FMul)
            	if(!getMemorySources(coeffmultop))
            		return false;
            else
            	return false;	// Expression not understood

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

            if!(getMemorySink(ExitAccInstruction)) // Get memory sink for this value
            		return false;

            continue;
          }


          if (VisitedInstr.insert(instr).second)
            Worklist.push_back(instr);

          // Remember that we completed the cycle.
          if (U == Phi){
            CycleComplete = true;
            dbgs() << "Cycle complete\n";
          }
        } // end iterating users
      } // end iterating worklist
    } // end iterating BBs/Instructions

  // Receive window size parameter from
  // loop iteration count
  WindowSize = getWindowSizeValue();

  if(!CycleComplete && !ExitAccInstruction && !valid())
	  return false;

  return true;
}

unsigned ConvolutionCheck::getArrayDimension(const LoadInst *instr, Value **baseptr) {
  GetElementPtrInst *ptrinstr = dyn_cast<GetElementPtrInst>(instr->getOperand(0));
  if (!ptrinstr)
    return 0;
  // Check if operand is derived by another load
  if (LoadInst *ldinstr = dyn_cast<LoadInst>(ptrinstr->getOperand(0)))
    return getArrayDimension(ldinstr, baseptr) + 1;

  *baseptr = ptrinstr->getOperand(0);
  return 1;
}

unsigned ConvolutionCheck::getPointerDepth(const Type *T) {
  if (T->isPointerTy() && T->getNumContainedTypes())
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

Function *ConvolutionCheck::addUseAcceleratorPredicate(Module* m) {
  std::string name = "UseAccelerator";

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

Function* ConvolutionCheck::addBypass(Function& F){

	if(!valid())
		return nullptr;

	Module *m = F.getParent();
	LLVMContext &modulectx = m->getContext();

	Function* usepredicate = addUseAcceleratorPredicate(m);

	BasicBlock& entry = F.getEntryBlock();

	// Create an upstream decision block
	BasicBlock *BBBypassDec = BasicBlock::Create(modulectx, "entry0", &F, &entry);

	// Create accelerator call site
	BasicBlock *BBBypass    = BasicBlock::Create(modulectx, "acc", &F, &entry);

	IRBuilder<> Builder(BBBypassDec);

	// Branch to bypass if predicate evaluates to true
	CallInst * bypasscall = Builder.CreateCall(usepredicate, "bypass"); // name only for debugging purpose
	Builder.CreateCondBr(bypasscall, BBBypass, &entry);

	Builder.SetInsertPoint(BBBypass);
	// distinguish interface on parameter type

	std::vector<Value*> args;
	args.push_back(PixelSource);
	args.push_back(PixelSink);
	args.push_back(KernelSource);
	args.push_back(WindowSize);
	for(Value* v : IndexParams)
		args.push_back(v);

	Function* bypass_iface;
	if(getPointerDepth(PixelSink->getType()) == 1)
		bypass_iface = create_hw_iface0(m, args);
	else if(getPointerDepth(PixelSink->getType()) == 2)
		bypass_iface = create_hw_iface1(m, args);


	Builder.CreateCall(bypass_iface, args);
	Builder.CreateRetVoid();
	return nullptr;
}

Function *ConvolutionCheck::create_hw_iface0(Module* m, ArrayRef<Value *> params){

	LLVMContext &modulectx = m->getContext();

	// Create bypass interface
	std::vector<Type*> bypassargs;
	bypassargs.push_back(Type::getInt8PtrTy(modulectx));	// Src (i8*)
	bypassargs.push_back(Type::getInt8PtrTy(modulectx)); 	// Dst (i8*)
	bypassargs.push_back(Type::getFloatPtrTy(modulectx));	// Kernel (float*)
	bypassargs.push_back(Type::getInt32Ty(modulectx));		// Window size (i32)
	bypassargs.push_back(Type::getInt32Ty(modulectx));		// x - coordinate (i32)
	bypassargs.push_back(Type::getInt32Ty(modulectx));		// y - coordinate (i32)

	FunctionType *fcnty = FunctionType::get(Type::getVoidTy(modulectx), bypassargs, false);
	Function *bypass_iface = Function::Create(fcnty,
												Function::ExternalLinkage,
												bypass_iface_fcn_prefix + "0",
												m);

	return bypass_iface;

}
Function *ConvolutionCheck::create_hw_iface1(Module* m, ArrayRef<Value *> params){
	LLVMContext &modulectx = m->getContext();

	// Create bypass interface
	std::vector<Type*> bypassargs;
	bypassargs.push_back(PointerType::get(Type::getInt8PtrTy(modulectx), 0));	// Src (i8**)
	bypassargs.push_back(PointerType::get(Type::getInt8PtrTy(modulectx), 0)); 	// Dst (i8**)
	bypassargs.push_back(Type::getFloatPtrTy(modulectx));	// Kernel (float*)
	bypassargs.push_back(Type::getInt32Ty(modulectx));		// Window size (i32)
	bypassargs.push_back(Type::getInt32Ty(modulectx));		// x - coordinate (i32)
	bypassargs.push_back(Type::getInt32Ty(modulectx));		// y - coordinate (i32)

	FunctionType *fcnty = FunctionType::get(Type::getVoidTy(modulectx), bypassargs, false);
	Function *bypass_iface = Function::Create(fcnty,
												Function::ExternalLinkage,
												bypass_iface_fcn_prefix + "1",
												m);
	return bypass_iface;
}

bool ConvolutionCheck::valid()
{
	bool valid = true;
	// all parameters available
	valid &= (WindowSize  && KernelSource &&
			  PixelSource && PixelSink
			  && !IndexParams.empty());

	if(!valid)
		return false;
	// Input/output type is the same (type is immutable)
	valid &= (PixelSource->getType() == PixelSink->getType());

	return valid;
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

    if(cv.isConvolution())
    	cv.addBypass(F);
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
