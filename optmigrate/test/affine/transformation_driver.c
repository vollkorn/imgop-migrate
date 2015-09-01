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

#include <sys/time.h>

#include "../../hwiface/max_hw_iface.h"
#include "../testdata/access/jpeg.h"

#include "transformations.h"

#define FILE_SUFFIX "_transformed.jpg\0"

void do_it(u_int8_t **in, u_int8_t **out, int nx, int ny, int channels);
void do_it_interpolate(u_int8_t **in, u_int8_t **out, int nx, int ny, int channels);
void do_it_hw(u_int8_t **in, u_int8_t **out, int nx, int ny, int channels);
int main(int argc, char **argv) {

  opterr = 0;

  int index = 0, verbose_output = 0, arg = 0, hw_accelerate = 0;

  int _size_arr = 0;

  u_int8_t **data_input;
  u_int8_t **data_output;

  u_int32_t nrows, ncols, nchannels = 3;

  int opt;
  char *filename_in = NULL;
  char *filename_out = NULL;

  while ((opt = getopt(argc, argv, "f:a::v::")) != -1) {
    switch (opt) {
    case 'f':
      filename_in = optarg;
      break;
    case 'v':
      verbose_output = 1;
      break;
    case 'a':
      hw_accelerate = 1;
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
        ncols = atoi(argv[index]);
        break;
      case 1:
        nrows = atoi(argv[index]);
        break;
      }
    }

    filename_in = "dummy";

    data_input = create_image_2d_rand(nrows, ncols, nchannels);
    data_output = create_image_2d(nrows, ncols, nchannels, 0);

  } else {

    if (jpeg_decompress(&data_input, &ncols, &nrows, &nchannels, filename_in)) {
      fprintf(stderr, "jpeg decompression failed\n");
      return 1;
    }
    data_output = create_image_2d(nrows, ncols, nchannels, 0);
  }

  filename_out = (char *)calloc(sizeof(char), strlen(filename_in) + sizeof(FILE_SUFFIX) + 1);
  strncpy(filename_out, filename_in, strlen(filename_in));
  strcat(filename_out, FILE_SUFFIX);

  // ------------------------------------------------------------------------------------
  if (hw_accelerate)
    do_it_hw(data_input, data_output, ncols, nrows, nchannels);
  else
    do_it(data_input, data_output, ncols, nrows, nchannels);

  // ------------------------------------------------------------------------------------
  if (verbose_output) {
    for (int j = 0; j < _size_arr; ++j) {
      for (int i = 0; i < _size_arr; ++i) {
        printf("%d\t", data_output[i][j]);
      }
      printf("\n");
    }
  }

  jpeg_compress(data_output, ncols, nrows, nchannels, filename_out);

  free_array_2d(nrows, data_input);
  free_array_2d(nrows, data_output);
}

void do_it_hw(u_int8_t **in, u_int8_t **out, int nx, int ny, int channels) {

  int dx = 0, dy = 0;

  float sx = 0, sy = 0;
  float shx = 0, shy = 0;

  dx = dy = 50;

  sx = sy = 0.5;

  shx = 0.5;
  shy = 0.5;

  // translate
  float T[3][3] = { { 1, 0, dx }, { 0, 1, dy }, { 0, 0, 1 } };

  // scale
  float S[3][3] = { { sx, 0, 0 }, { 0, sy, 0 }, { 0, 0, 1 } };

  // shear
  float SH[3][3] = { { 1, shx, 0 }, { shy, 1, 0 }, { 0, 0, 1 } };

  max_affine_transform_3((const u_int8_t **)in, out, nx, ny, SH);
}

void do_it(u_int8_t **in, u_int8_t **out, int nx, int ny, int channels) {
#ifdef MEASURE_EXECUTIONTIME
  static struct timeval tm1, tm2;

  gettimeofday(&tm1, NULL);
#endif
  int dx = 0, dy = 0;

  float sx = 0, sy = 0;
  float shx = 0, shy = 0;

  dx = dy = 50;

  sx = sy = 0.5;

  shx = 0.5;
  shy = 0.5;

  // translate
  float T[3][3] = { { 1, 0, dx }, { 0, 1, dy }, { 0, 0, 1 } };

  // scale
  float S[3][3] = { { sx, 0, 0 }, { 0, sy, 0 }, { 0, 0, 1 } };

  // shear
  float SH[3][3] = { { 1, shx, 0 }, { shy, 1, 0 }, { 0, 0, 1 } };

  arr_set_value(out, ny, nx, 0);
  if(channels == 1)
	  transform_2d1(in, out, nx, ny, T);
  else if(channels == 3)
	  transform_2d3(in, out, nx, ny, T);
//  arr_set_value(in, ny, nx, 0);
//  transform(out, in, nx, ny, S);
//
//  arr_set_value(out, ny, nx, 0);
//  transform(in, out, nx, ny, SH);

#ifdef MEASURE_EXECUTIONTIME
  gettimeofday(&tm2, NULL);

  unsigned long long t = 1000 * (tm2.tv_sec - tm1.tv_sec) + (tm2.tv_usec - tm1.tv_usec) / 1000;

  fprintf(stdout, "Done. Execution time %llu ms\n", t);
#endif
}

void do_it_interpolate(u_int8_t **in, u_int8_t **out, int nx, int ny, int channels) {
  float sx = 0, sy = 0;
  sx = sy = 1.5;
  // scale
  float S[3][3] = { { sx, 0, 0 }, { 0, sy, 0 }, { 0, 0, 1 } };
  float **positions = (float **)create_image_2d(ny, nx * 2, 4, 0);

  transform_(in, out, positions, nx, ny, S);
  arr_set_value(out, ny, nx, 0);
  bilinear_interpolate(in, out, positions, ny, ny, channels);

  //	arr_copy(in, out, ny, nx, channels);
}
