/*
 * convolve.h
 *
 *  Created on: Feb 18, 2015
 *      Author: lukas
 */

#ifndef CONVOLVE_CONVOLVE_H_
#define CONVOLVE_CONVOLVE_H_

#include <sys/types.h>

void convolve_2d1_noninline_1darr(const u_int8_t *in, u_int8_t *out, const float *kernel, const int kn, const int dim_x,
                         const int dim_y, float scale);

void convolve_2d1_noninline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int dim_x,
                              const int dim_y, float scale);

void convolve_2d1_inline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int dim_x,
                        const int dim_y, float scale);

void convolve_2d3_inline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn,
                               const int dim_x, const int dim_y, float scale);

#endif /* CONVOLVE_CONVOLVE_H_ */
