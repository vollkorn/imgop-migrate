/*
 * ConvolutionFilter.cpp
 *
 *  Created on: Feb 6, 2015
 *      Author: lukas
 */


#include <sys/types.h>

#include "convolve.h"

void convolve_dual_array(
        const u_int8_t **in,
        u_int8_t **out,
        const float **kernel,
        const int nx,           // image x dimension
        const int ny,           // image y dimension
        const int kn
        )
{
    const int khalf = kn / 2;

    int s = 0;
    int k = 0;

    for (int j = -khalf; j <= khalf; j++)
    {
        for (int i = -khalf; i <= khalf; i++)
        {
            s += kernel[i + khalf][j + khalf];
        }
    }

    for (int x = khalf; x < nx - khalf; x++)        // iterate x-coordinate
    {
        for (int y = khalf; y < ny - khalf; y++)    // iterate y-coordinate
        {
        	float pixel = 0.0;
	        int       c = 0;
            for (int j = -khalf; j <= khalf; j++)
	        {
                for (int i = -khalf; i <= khalf; i++)
                {
                    pixel += in[x][y] * kernel[i+khalf][j+khalf];       // in [x][x]
                }
        	}
            out[x][y] = (u_int8_t) (pixel / s);
       }
    }
}
