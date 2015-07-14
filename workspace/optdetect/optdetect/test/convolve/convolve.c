/*
 * ConvolutionFilter.cpp
 *
 *  Created on: Feb 6, 2015
 *      Author: lukas
 */


#include <sys/types.h>

#include "convolve.h"


void filter_kernel(const u_int8_t *in,
        u_int8_t *out,
        const float *kernel,
		const int kn,
        const int m,
        const int n,
        const int size_x,
        const int size_y)
{
    const int khalf = kn / 2;

    float pixel = 0.0;
    int c = 0;

    // actual filter operation
    for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
            pixel += in[(n - j) * size_x + m - i] * kernel[1-j * kn + 1 -i];

    out[n * size_x + m] = (u_int8_t) (pixel);

}

void filter_kernel_2d(const u_int8_t **in,
        u_int8_t **out,
        const float *kernel,
		const int kn,
        const int x,
        const int y)
{
    const int khalf = kn / 2;

    float pixel = 0.0;
    int c = 0;

    // actual filter operation
    for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
            pixel += in[y+j][x+i] * kernel[c++];

    out[y][x] = (u_int8_t) (pixel);

}
//
//void filter_kernel_2d_no_indirection(
//        const int m,
//        const int n,
//        const u_int8_t in[m][n],
//        u_int8_t out[m][n],
//        const float *kernel,
//        const int x,
//        const int y,
//        const int s,
//        const int kn)
//{
//    const int khalf = kn / 2;
//
//    float pixel = 0.0;
//    int c = 0;
//
//    // actual filter operation
//    for (int j = -khalf; j <= khalf; j++)
//        for (int i = -khalf; i <= khalf; i++)
//            pixel += in[y+j][x+i] * kernel[c++];
//
//    out[y][x] = (u_int8_t) (pixel / s);
//
//}

void convolve_arr_linear(
        const u_int8_t *in,
        u_int8_t *out,
        const float *kernel,
        const int kn,
        const int dim_x,           // image x dimension
        const int dim_y           // image y dimension
        )
{
    const int khalf = kn / 2;

    for (int m = khalf; m < dim_x - khalf; m++)    // iteration over image pixels
        for (int n = khalf; n < dim_y - khalf; n++)
            filter_kernel(in, out, kernel, kn, m, n, dim_x, dim_y);
}

void convolve_arr_indirection(
        const u_int8_t **in,
        u_int8_t **out,
        const float *kernel,
        const int kn,
        const int dim_x,           // image x dimension
        const int dim_y           // image y dimension
        ){
    const int khalf = kn / 2;

    for (int m = khalf; m < dim_x - khalf; m++)    // iteration over image pixels
        for (int n = khalf; n < dim_y - khalf; n++)
        	filter_kernel_2d(in, out, kernel, kn, n, m);
}

void convolve_loop_nest(
        const u_int8_t **in,
        u_int8_t **out,
        const float *kernel,
        const int kn,
        const int dim_x,           // image x dimension
        const int dim_y           // image y dimension
        ){
    const int khalf = kn / 2;

    for (int y = khalf; y < dim_x - khalf; y++) // iteration over image pixels
      for (int x = khalf; x < dim_y - khalf; x++) {
        float pixel = 0.0;
        int c = 0;

        // actual filter operation
        for (int j = -khalf; j <= khalf; j++)
          for (int i = -khalf; i <= khalf; i++)
            pixel += in[x + j][y + i] * kernel[c++];

        out[x][y] = (u_int8_t)(pixel);
      }
}
