/*
 * convolve.h
 *
 *  Created on: Feb 18, 2015
 *      Author: lukas
 */

#ifndef CONVOLVE_CONVOLVE_H_
#define CONVOLVE_CONVOLVE_H_

#include <sys/types.h>

void convolve(
        const u_int8_t *in,
        u_int8_t *out,
        const float *kernel,
        const int nx,           // image x dimension
        const int ny,           // image y dimension
        const int kn
        );

void convolve_fixed_3_3(
        const u_int8_t *in,
        u_int8_t *out,
        const float *kernel,
        const int nx,           // image x dimension
        const int ny            // image y dimension
        );



#endif /* CONVOLVE_CONVOLVE_H_ */
