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
#include <sys/time.h>
// the dirty rest
#include "convolve.h"

#include "../testdata/access/jpeg.h"

#define FILE_SUFFIX "_convolve.jpg\0"

extern int opterr;

#define MEASURE_EXECUTIONTIME

void create_filter_kernel(int size, float *kernel, float init, float *scale) {

  for (int i = 0; i < size * size; ++i) {
    kernel[i] = init;
    *scale += init;
  }
}

void print_help() {

  printf("-f filename\n");

  printf("-o <edge, sharpen, motion>\n");
  printf(" or \n");
  printf(" x y c s  x = #pixels in x,  y = #pixels in y, c = #channel, s = filter size\n");
  printf("-v verbose\n");
}

int main(int argc, char **argv) {

  opterr = 0;

  int index = 0, verbose_output = 0, arg = 0;

  int _size_arr = 0, _size_filter = 0;

  u_int8_t **data_input;
  u_int8_t **data_output;

  u_int32_t size_y, size_x, nchannels = 1;

  int opt;
  char *filename_in = NULL;
  char *filename_out = NULL;
  char *operation = NULL;
  while ((opt = getopt(argc, argv, "f:o:v::h::")) != -1) {
    switch (opt) {
    case 'f':
      filename_in = optarg;
      break;
    case 'o':
      operation = optarg;
      break;
    case 'v':
      verbose_output = 1;
      break;
    case 'h':
      print_help();
      exit(EXIT_SUCCESS);
    default:
      fprintf(stderr, "Usage: %s -f [file...]\n", argv[0]);
      exit(EXIT_FAILURE);
    }
  }

  if (!filename_in) {
    for (index = optind; index < argc; index++) {

      switch (arg++) {
      case 0:
        size_x = atoi(argv[index]);
        break;
      case 1:
        size_y = atoi(argv[index]);
        break;
      case 2:
        nchannels = atoi(argv[index]);
        break;
      case 3:
        _size_filter = atoi(argv[index]);
        break;
      }
    }

    filename_in = "dummy";

    data_input = create_image_2d_rand(size_y, size_x, nchannels);
    data_output = create_image_2d(size_y, size_x, nchannels, 0);
  } else {

    if (jpeg_decompress(&data_input, &size_x, &size_y, &nchannels, filename_in)) {
      fprintf(stderr, "Jpeg decompression failed\n");
      return 1;
    }

    fprintf(stdout, "Jpeg decompressed %dx%dx%d\n", size_x, size_y, nchannels);

    for (index = optind; index < argc; index++) {
      switch (arg++) {
      case 0:
        _size_filter = atoi(argv[index]);
        break;
      }
    }

    data_output = create_image_2d(size_y, size_x, nchannels, 0);
  }

  filename_out = (char *)calloc(sizeof(char), strlen(filename_in) + sizeof(FILE_SUFFIX) + 1);
  strncpy(filename_out, filename_in, strlen(filename_in));
  strcat(filename_out, FILE_SUFFIX);

  float scale;
  float *kernel;
  if (!operation) {

    kernel = malloc(_size_filter * _size_filter * sizeof(float));

    float init = 0.1;
    create_filter_kernel(_size_filter, &kernel[0], init, &scale);
  } else {

    if (!strncmp(operation, "edge", 4)) {
      _size_filter = 5;
      kernel = malloc(_size_filter * _size_filter * sizeof(float));
      float kernel_[] = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 24,
                          -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
      memcpy(kernel, kernel_, _size_filter * _size_filter * sizeof(float));
      scale = 1.0;
    }

    if (!strncmp(operation, "sharpen", 7)) {
      _size_filter = 3;
      kernel = malloc(_size_filter * _size_filter * sizeof(float));
      float kernel_[] = { -1, -1, -1, -1, 9, -1, -1, -1, -1, };
      memcpy(kernel, kernel_, _size_filter * _size_filter * sizeof(float));
      scale = 1.0;
    }

    if (!strncmp(operation, "motion", 6)) {
      _size_filter = 9;
      kernel = malloc(_size_filter * _size_filter * sizeof(float));
      float kernel_[] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, };

      memcpy(kernel, kernel_, _size_filter * _size_filter * sizeof(float));
      scale = 9;
    }
  }

  if (_size_filter % 2 == 0) {
    printf("Invalid filter size, must be odd: %d\n", _size_filter);
    free_array_2d(size_y, data_input);
    free_array_2d(size_y, data_output);
    return 1;
  }
#ifdef MEASURE_EXECUTIONTIME
  static struct timeval tm1, tm2;
  gettimeofday(&tm1, NULL);

#endif
  //  convolve_loop_nest((const u_int8_t **)data_input, data_output, &kernel[0], _size_filter, ncols, nrows, scale);

  if (nchannels == 1){
	  convolve_2d1_inline_2darr_sym
//    convolve_2d1_inline_2darr
	((const u_int8_t **)data_input, data_output, &kernel[0], _size_filter, size_x, size_y,
                              scale);
  }
  if (nchannels == 3)
    convolve_2d3_inline_2darr((const u_int8_t **)data_input, data_output, &kernel[0], _size_filter, size_x, size_y,
                              scale);

#ifdef MEASURE_EXECUTIONTIME
  gettimeofday(&tm2, NULL);
  unsigned long long t = 1000 * (tm2.tv_sec - tm1.tv_sec) + (tm2.tv_usec - tm1.tv_usec) / 1000;
  fprintf(stdout, "Done. Execution time (sw) %llu ms\n", t);
#endif

  if (verbose_output) {
    for (int i = 0; i < size_y; ++i) {
      for (int j = 0; j < size_x; ++j) {
        printf("%d\t", data_output[i][j]);
      }
      printf("\n");
    }
  }

  jpeg_compress(data_output, size_x, size_y, nchannels, filename_out);

  free_array_2d(size_y, data_input);
  free_array_2d(size_y, data_output);

  return 0;
}
