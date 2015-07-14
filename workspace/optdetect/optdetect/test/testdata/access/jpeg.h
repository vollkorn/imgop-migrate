/*
 * jpeg.h
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

#ifndef OPTDETECT_TEST_TESTDATA_ACCESS_JPEG_H_
#define OPTDETECT_TEST_TESTDATA_ACCESS_JPEG_H_

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include <sys/types.h>
#include <jpeglib.h>

void free_array_2d(size_t nrows, u_int8_t** arr);

u_int8_t** create_array_2d(size_t nrows, size_t ncols, u_int8_t init);

void arr_set_value(u_int8_t **arr, size_t nrows, size_t ncols, u_int8_t val);

void arr_copy(u_int8_t **src, u_int8_t **dst, size_t ny, size_t nx);

int jpeg_compress(u_int8_t** data, u_int32_t nx, u_int32_t ny, u_int32_t nc, const char* filename);

int jpeg_decompress(u_int8_t*** data, u_int32_t* nx, u_int32_t* ny, u_int32_t* nc, const char* filename);




#endif /* OPTDETECT_TEST_TESTDATA_ACCESS_JPEG_H_ */
