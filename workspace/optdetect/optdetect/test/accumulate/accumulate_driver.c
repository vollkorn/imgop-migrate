/*
 * accumulate_driver.c
 *
 *  Created on: Apr 29, 2015
 *      Author: lukas
 */


#include <sys/types.h>

#include <stdio.h>
#include <stdlib.h>

#include "accumulate.h"


void       free_array_2d(size_t nrows, int_type_t** arr)
{
    for (int i = 0; i < nrows; i++)
    {
        free(arr[i]);
    }
    free(arr);
}

int_type_t** create_array_2d(size_t nrows, size_t ncols, int_type_t init)
{
    int_type_t ** foo = (int_type_t **) malloc(sizeof(int_type_t*) * nrows);

    for(int i = 0; i < nrows; i++)
    {
        foo[i] = (int_type_t *) malloc(sizeof(int_type_t) * ncols);

        for(int j = 0; j < ncols; j++)
        {
            foo[i][j] = init;
        }
    }
    return foo;
}

int main(int argc, char**argv)
{

    int _size_arr    = atoi(argv[1]);
    int _size_window = atoi(argv[2]);


    if(_size_arr < _size_window)
        return 1;

    size_t nrows, ncols;

    nrows = ncols = _size_arr;


    int_type_t ** foo = create_array_2d(nrows, ncols, 1);
    int_type_t ** bar = create_array_2d(nrows, ncols, 1);

    accumulate_2d_addr((const int_type_t**)foo, bar, _size_window + 1, _size_window + 1, _size_window);

    printf("Acc: %d\n", bar[_size_window + 1][ _size_window + 1]);

    free_array_2d(nrows, foo);
    free_array_2d(nrows, bar);

    return 0;
}
