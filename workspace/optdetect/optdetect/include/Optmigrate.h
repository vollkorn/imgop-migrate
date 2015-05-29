/*
 * Optmigrate.h
 *
 *  Created on: May 28, 2015
 *      Author: lukas
 */

#ifndef OPTDETECT_INCLUDE_OPTMIGRATE_H_
#define OPTDETECT_INCLUDE_OPTMIGRATE_H_


namespace {

    class Loop;
    class ScalarEvolution;

    struct ConvolutionCheck
      {

          /// This enum represents the kinds of inductions that we support.
          enum InductionKind
          {
              IK_NoInduction,         ///< Not an induction variable.
              IK_IntInduction,        ///< Integer induction variable. Step = 1.
              IK_ReverseIntInduction, ///< Reverse int induction variable. Step = -1.
              IK_PtrInduction,    ///< Pointer induction var. Step = sizeof(elem).
              IK_ReversePtrInduction ///< Reverse ptr indvar. Step = - sizeof(elem).
          };

          enum MemLayoutKind
          {
              MEM_LAYOUT_UNKNOW,
              MEM_LAYOUT_INDIRECTION,    ///< Memory layout is an indirection vector
              MEM_LAYOUT_ROW_MAJOR,      ///< Memory layout is in row-major order
              MEM_LAYOUT_COL_MAJOR       ///< Memory layout is in column major order
          };

          Loop* L;
          ScalarEvolution *SE;

          //
          ConvolutionCheck(Loop *L, ScalarEvolution *SE);

          bool isConvolution();
};


#endif /* OPTDETECT_INCLUDE_OPTMIGRATE_H_ */
