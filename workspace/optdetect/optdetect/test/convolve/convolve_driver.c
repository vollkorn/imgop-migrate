/*
 * accumulate_driver.c
 *
 *  Created on: Apr 29, 2015
 *      Author: lukas
 */


// Glibc
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <string.h>

// the dirty rest
#include "convolve.h"

#include "../testdata/access/jpeg.h"

#define FILE_SUFFIX "_compressed.jpg\0"

extern int opterr;

int main(int argc, char**argv)
{

	opterr = 0;

	int index = 0, verbose_output = 0, arg = 0;

	int _size_arr = 0,  _size_filter = 0;

    u_int8_t ** data_input;
    u_int8_t ** data_output;

    u_int32_t nrows, ncols, nchannels;

    int opt;
    char* filename_in = NULL;
    char* filename_out = NULL;

    while ((opt = getopt(argc, argv, "f:v::")) != -1) {
      switch (opt) {
      case 'f':
    	  filename_in = optarg;
        break;
      case 'v':
    	  verbose_output = 1;
    	  break;
      default:
        fprintf(stderr, "Usage: %s -f [file...]\n", argv[0]);
        exit(EXIT_FAILURE);
      }
    }

    if (!filename_in) {
      for (index = optind; index < argc; index++) {

        switch (arg++) {
        case 0:
        	_size_arr = atoi(argv[index]);
          break;
        case 1:
          _size_filter = atoi(argv[index]);
          break;
        }
      }

      nrows = ncols = _size_arr;

      filename_in = "dummy";

      data_input  = create_array_2d(nrows, ncols, 1);
      data_output = create_array_2d(nrows, ncols, 0);

    }else{

    	if(jpeg_decompress(&data_input, &ncols, &nrows, &nchannels, filename_in)){
    		fprintf(stderr, "jpeg decompression failed\n");
    		return 1;
    	}

        for (index = optind; index < argc; index++) {
          switch (arg++) {
          case 0:
            _size_filter = atoi(argv[index]);
            break;
          }
        }

    	data_output = create_array_2d(nrows, ncols, 0);
    }

    filename_out = (char *)calloc(sizeof(char), strlen(filename_in) + sizeof(FILE_SUFFIX) + 1);
    strncpy(filename_out, filename_in, strlen(filename_in));
    strcat(filename_out, FILE_SUFFIX);

    int i = 0, j = 0;

    float kernel_3_3[] = {0.1, 0.1, 0.1,
    				  0.1, 0.1, 0.1,
					  0.1, 0.1, 0.1};

    float kernel_5_5[] = {2.0, 2.0, 2.0, 2.0, 2.0,
    				  2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0};

    float kernel_7_7[] = {2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0,
    				  2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0,  2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0,
					  2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0};


    if(_size_filter == 3)
    	convolve_loop_nest((const u_int8_t**)data_input, data_output, &kernel_3_3[0], 3, ncols, nrows);
    else if(_size_filter == 5)
    	convolve_loop_nest((const u_int8_t**)data_input, data_output, &kernel_5_5[0], 5, ncols, nrows);
    else if(_size_filter == 7)
    	convolve_loop_nest((const u_int8_t**)data_input, data_output, &kernel_7_7[0], 7, ncols, nrows);
    else{
      printf("invalid filter size!\n");
      free_array_2d(nrows, data_input);
      free_array_2d(nrows, data_output);
      return 1;
    }
    if (verbose_output) {
      for (j = 0; j < _size_arr; ++j) {
        for (i = 0; i < _size_arr; ++i) {
          printf("%d\t", data_output[i][j]);
        }
        printf("\n");
      }
    }

    jpeg_compress(data_output, ncols, nrows, 1, filename_out);

    free_array_2d(nrows, data_input);
    free_array_2d(nrows, data_output);

    return 0;
}
