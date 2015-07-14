/*
 * convolve.h
 *
 *  Created on: Feb 18, 2015
 *      Author: lukas
 */

#ifndef CONVOLVE_CONVOLVE_H_
#define CONVOLVE_CONVOLVE_H_

#include <sys/types.h>

void convolve_arr_linear(
        const u_int8_t *in,
        u_int8_t *out,
        const float *kernel,
        const int kn,
        const int dim_x,           // image x dimension
        const int dim_y           // image y dimension
        );

void convolve_arr_indirection(
        const u_int8_t **in,
        u_int8_t **out,
        const float *kernel,
        const int kn,
        const int dim_x,           // image x dimension
        const int dim_y           // image y dimension
        );

void convolve_loop_nest(
        const u_int8_t **in,
        u_int8_t **out,
        const float *kernel,
        const int kn,
        const int dim_x,           // image x dimension
        const int dim_y           // image y dimension
        );

#endif /* CONVOLVE_CONVOLVE_H_ */
