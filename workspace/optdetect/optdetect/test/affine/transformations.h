/*
 * transformations.h
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

#ifndef OPTDETECT_TEST_AFFINE_TRANSFORMATIONS_H_
#define OPTDETECT_TEST_AFFINE_TRANSFORMATIONS_H_


#include <sys/types.h>
#include "interpolation.h"

void matrix_multiply_float();

void transform_2d1(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, float M[3][3]);

void transform_2d3(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, float M[3][3]);

void transform_(u_int8_t **data_in, u_int8_t **data_out, float** positions, int nx, int ny, float M[3][3] );


#endif /* OPTDETECT_TEST_AFFINE_TRANSFORMATIONS_H_ */
