/*
 * transformations.h
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

#ifndef OPTDETECT_TEST_AFFINE_TRANSFORMATIONS_H_
#define OPTDETECT_TEST_AFFINE_TRANSFORMATIONS_H_


#include <sys/types.h>

void matrix_multiply();

void transform(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, int l, int m, float M[l][m] );

#endif /* OPTDETECT_TEST_AFFINE_TRANSFORMATIONS_H_ */
