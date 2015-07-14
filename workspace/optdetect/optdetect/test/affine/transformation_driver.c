/*
 * affine_driver.c
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <string.h>

#include "../testdata/access/jpeg.h"

#include "transformations.h"

#define FILE_SUFFIX "_transformed.jpg\0"

void do_it(u_int8_t** in, u_int8_t** out, int nx, int ny);

int main(int argc, char**argv){

	opterr = 0;

	int index = 0, verbose_output = 0, arg = 0, i= 0, j = 0;

	int _size_arr = 0;

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
    	data_output = create_array_2d(nrows, ncols, 0);
    }

    filename_out = (char *)calloc(sizeof(char), strlen(filename_in) + sizeof(FILE_SUFFIX) + 1);
    strncpy(filename_out, filename_in, strlen(filename_in));
    strcat(filename_out, FILE_SUFFIX);

// ------------------------------------------------------------------------------------

    do_it(data_input, data_output, ncols, nrows);

// ------------------------------------------------------------------------------------
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

}



void do_it(u_int8_t** in, u_int8_t** out, int nx, int ny){

	int dx = 0, dy = 0;

	float sx = 0, sy = 0;
	float shx = 0, shy = 0;

	dx = dy = 50;

	sx = sy = 0.5;

	shx = 0.5;
	shy = 0.5;

	// translate
	float T[3][3] = {{1, 0, dy},{0, 1, dy},{0, 0, 1}};

	// scale
	float S[3][3] = {{sx, 0, 0},{0, sy, 0},{0, 0, 1}};

	// shear
	float SH[3][3] = {{1, shx, 0},{shy, 1, 0},{0, 0, 1}};

	arr_set_value(out, ny, nx, 0);
	transform(in, out, nx, ny, 3, 3, T);

	arr_set_value(in, ny, nx, 0);
	transform(out, in, nx, ny, 3, 3, S);

	arr_set_value(out, ny, nx, 0);
	transform(in, out, nx, ny, 3, 3, SH);

//	arr_copy(in, out, ny, nx);
}
