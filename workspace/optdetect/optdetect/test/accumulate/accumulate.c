/*
 * accumulate.c
 *
 *  Created on: Apr 27, 2015
 *      Author: lukas
 */

#include "accumulate.h"


void accumulate_1d_addr(const int_type_t *in, int_type_t *out,
        const int_type_t y, const int_type_t x,
        const int_type_t rowstride,
        const int_type_t s, const int_type_t w_size)
{
    int_type_t w_size_half = w_size / 2;

    int_type_t acc = 0;

    // accumulate over filter window
    for (int_type_t j = -w_size_half; j <= w_size_half; j++)
        for (int_type_t i = -w_size_half; i <= w_size_half; i++)
            acc += in[(x - j) * rowstride + y - i];

    out[x * rowstride + y] = acc;

}

void accumulate_2d_addr(const int_type_t** in, int_type_t** out,
                        const int_type_t y, const int_type_t x,
                        const int_type_t w_size)
{
    int_type_t w_size_half = w_size / 2;

    int_type_t acc = 0;

    // accumulate over filter window
    for (int_type_t j = -w_size_half; j <= w_size_half; j++)
        for (int_type_t i = -w_size_half; i <= w_size_half; i++)
            acc += in[y+j][x+i];

    out[y][x] = acc;
}

void accumulate_2d_no_indirection(const int_type_t n,
                        const int_type_t m,
                        const int_type_t in[n][m], int_type_t out[n][m],
                        const int_type_t y, const int_type_t x,
                        const int_type_t w_size)
{
    int_type_t w_size_half = w_size / 2;

    int_type_t acc = 0;

    // accumulate over filter window
    for (int_type_t j = -w_size_half; j <= w_size_half; j++)
        for (int_type_t i = -w_size_half; i <= w_size_half; i++)
            acc += in[y+j][x+i];

    out[y][x] = acc;
}

void accumulate_2d_addr_arr(const int_type_t y, const int_type_t x, const int_type_t in[][y], int_type_t** out,
                          const int_type_t w_size)
{
    int_type_t w_size_half = w_size / 2;

    int_type_t acc = 0;

    // accumulate over filter window
    for (int_type_t j = -w_size_half; j <= w_size_half; j++)
        for (int_type_t i = -w_size_half; i <= w_size_half; i++)
            acc += in[y+j][x+i];

    out[y][x] = acc;
}

int_type_t accumulate_1d_linear(const int_type_t* in, const int_type_t n, const int_type_t m)
{
    int_type_t acc = 0;

    for (int_type_t j = n; j <= m; j++)
        acc += in[j];

    return acc;
}

int foo(int *A, int *B, int n)
{
    unsigned sum = 0;
    for (int i = 0; i < n; ++i)
        if (A[i] > B[i])
            sum += A[i] + 5;
    return sum;
}

int_type_t accumulate_2d_addr_fixed(const int_type_t** in, const int_type_t y,
                                const int_type_t x)
{
    const int_type_t w_size_half = 8;

    int_type_t acc = 0;

    // accumulate over filter window
    for (int_type_t j = -w_size_half; j <= w_size_half; j++)
        for (int_type_t i = -w_size_half; i <= w_size_half; i++)
            acc += in[y+j][x+i];

    return acc;
}
