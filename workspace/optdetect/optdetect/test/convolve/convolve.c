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
        const int m,
        const int n,
        const int size_x,
        const int size_y,
        const int s,
        const int kn)
{
    const int khalf = kn / 2;

    float pixel = 0.0;
    int c = 0;

    // actual filter operation
    for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
            pixel += in[(n - j) * size_x + m - i] * kernel[c++];

    out[n * size_x + m] = (u_int8_t) (pixel / s);

}

void filter_kernel_2d(const u_int8_t **in,
        u_int8_t **out,
        const float *kernel,
        const int m,
        const int n,
        const int x,
        const int y,
        const int s,
        const int kn)
{
    const int khalf = kn / 2;

    float pixel = 0.0;
    int c = 0;

    // actual filter operation
    for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
            pixel += in[y+j][x+i] * kernel[c++];

    out[y][x] = (u_int8_t) (pixel / s);

}

void filter_kernel_2d_no_indirection(
        const int m,
        const int n,
        const u_int8_t in[m][n],
        u_int8_t out[m][n],
        const float *kernel,
        const int x,
        const int y,
        const int s,
        const int kn)
{
    const int khalf = kn / 2;

    float pixel = 0.0;
    int c = 0;

    // actual filter operation
    for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
            pixel += in[y+j][x+i] * kernel[c++];

    out[y][x] = (u_int8_t) (pixel / s);

}

void convolve(
        const u_int8_t *in,
        u_int8_t *out,
        const float *kernel,
        const int nx,           // image x dimension
        const int ny,           // image y dimension
        const int kn
        )
{
    const int khalf = kn / 2;

    int s = 0;
    int k = 0;
    for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
            s += kernel[k++];

    for (int m = khalf; m < nx - khalf; m++)    // iteration over image pixels
        for (int n = khalf; n < ny - khalf; n++)
            filter_kernel(in, out, kernel, m, n, nx, ny, s, kn);
}
