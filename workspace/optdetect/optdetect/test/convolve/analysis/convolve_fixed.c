/*
 * ConvolutionFilter.cpp
 *
 *  Created on: Feb 6, 2015
 *      Author: lukas
 */


#include <sys/types.h>

#include "convolve.h"

#define KERNEL_SIZE 3
    
void convolve_fixed_3_3(
        const u_int8_t *in,
        u_int8_t *out,
        const float *kernel, 
        const int nx,           // image x dimension
        const int ny            // image y dimension
        )
{
    // normalize
    const int khalf = KERNEL_SIZE / 2;

    int s = 0;
    int k = 0;
    for (int j = -khalf; j <= khalf; j++)
    {
        for (int i = -khalf; i <= khalf; i++)
        {
            s += kernel[k++];
        }
    }


    for (int m = khalf; m < nx - khalf; m++)
    {
        for (int n = khalf; n < ny - khalf; n++)
        {
        	float pixel = 0.0;
	        int c = 0;        

	        pixel += in[(n - (-1)) * nx + m - (-1)] * kernel[c++];
	        pixel += in[(n - 0)    * nx + m - (-1)] * kernel[c++];
	        pixel += in[(n - 1)    * nx + m - (-1)] * kernel[c++];

	        pixel += in[(n - (-1)) * nx + m - 0] * kernel[c++];
	        pixel += in[(n - 0) * nx + m - 0] * kernel[c++];
	        pixel += in[(n - 1) * nx + m - 0] * kernel[c++];

	        pixel += in[(n - (-1)) * nx + m - 1] * kernel[c++];
	        pixel += in[(n - 0) * nx + m - 1] * kernel[c++];
	        pixel += in[(n - 1) * nx + m - 1] * kernel[c++];

            out[n * nx + m] = (u_int8_t) (pixel / s);
       }
    }
}
