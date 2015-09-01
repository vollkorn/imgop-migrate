/*
 * convolve.h
 *
 *  Created on: Feb 18, 2015
 *      Author: lukas
 */

#ifndef CONVOLVE_CONVOLVE_H_
#define CONVOLVE_CONVOLVE_H_

#include "../polybench-c/utilities/polybench.h"

/* Default to STANDARD_DATASET. */
# if !defined(MINI_DATASET) && !defined(SMALL_DATASET) && !defined(LARGE_DATASET) && !defined(EXTRALARGE_DATASET)
#  define STANDARD_DATASET
# endif

#  ifdef STANDARD_DATASET /* Default if unspecified. */
#   define TSTEPS 20
#   define N 1000
#   define CZ 256
#   define CYM 256
#   define CXM 256
#  endif

# ifndef DATA_TYPE
#  define DATA_TYPE double
#  define DATA_PRINTF_MODIFIER "%0.2lf "
# endif

# define _PB_CZ POLYBENCH_LOOP_BOUND(CZ,cz)
# define _PB_CYM POLYBENCH_LOOP_BOUND(CYM,cym)
# define _PB_CXM POLYBENCH_LOOP_BOUND(CXM,cxm)

# define _PB_TSTEPS POLYBENCH_LOOP_BOUND(TSTEPS,tsteps)
# define _PB_N POLYBENCH_LOOP_BOUND(N,n)


#include <sys/types.h>

void convolve_2d1_noninline_1darr(const u_int8_t *in, u_int8_t *out, const float *kernel, const int kn, const int dim_x,
                         const int dim_y, float scale);

void convolve_2d1_noninline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int dim_x,
                              const int dim_y, float scale);

void convolve_2d1_inline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int dim_x,
                        const int dim_y, float scale);

void convolve_2d1_inline_2darr_sym(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int dim_x,
        const int dim_y, float scale);

void convolve_2d3_inline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn,
                               const int dim_x, const int dim_y, float scale);

#endif /* CONVOLVE_CONVOLVE_H_ */
