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



#include <iostream>
#include <vector>

#include "llvm/Pass.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"

#include "llvm/ADT/Statistic.h"

#include "llvm/Support/raw_ostream.h"

#include "llvm/Analysis/LoopInfo.h"

#include "llvm/Transforms/Utils/SimplifyIndVar.h"
#include "llvm/Transforms/Utils/LoopUtils.h"

using namespace llvm;

namespace
{

    // Hello - The first implementation, without getAnalysisUsage.
    class Optdetect: public FunctionPass
    {
    public:
        static char ID; // Pass identification, replacement for typeid

        LoopInfo* LI = nullptr;


        Optdetect() : FunctionPass(ID) {}
        virtual ~Optdetect() {}

        bool runOnFunction(Function &F) override
        {

            errs() << "Hello: ";
            errs().write_escaped(F.getName()) << '\n';


            LI = &getAnalysis<LoopInfo>();

            if(F.isDeclaration())
                return false;


            if(nullptr == LI)
                return false;

            SmallVector<Loop *, 8> Worklist;

//                for(BasicBlock& bb : F.getBasicBlockList())
//                {
//                    int depth = li->getLoopDepth(&bb);
//
//                    if(depth > 0)
//                    {
//                        outs() << "Found BB @ depth" << depth << "\n";
//                    }
//                }


//                    for (LoopInfo::iterator I = li->begin(), E = li->end(); I != E;++I)
//                    {
//                        Loop* loop = *I;
//
//                        outs() << "Found loop with depth " << loop->getLoopDepth() << "\n";
//
//                        for(Loop* subloop :  loop->getSubLoops())
//                        {
//                            outs() << "Found loop with depth " << subloop->getLoopDepth() << "\n";
//                        }
//
//                    }
            } else {

                errs() << "Loop info unavailable\n";

            }
            return false;
        }

        void print(raw_ostream &O, const Module *M) const
        {
            O << "Function pass print called: " << this->getPassName() << "\n";
        }

        virtual void getAnalysisUsage(AnalysisUsage &AU) const override
        {
            AU.setPreservesAll();
            AU.addRequired<LoopInfo>();
        }

        void getInnermostLoops(Loop &L, SmallVectorImpl<Loop*> &V);

    };
}

void Optdetect::getInnermostLoops(Loop& L, SmallVectorImpl<Loop*> &V)
{
    if(L.empty())   // Checks if loop have nested loops
        return V.push_back(&L);

    for(Loop *inner : L)
        getInnermostLoops(*inner, V);
}


char Optdetect::ID = 0;

static RegisterPass<Optdetect> Pass("optdetect", "Detect an operation", false, true);

