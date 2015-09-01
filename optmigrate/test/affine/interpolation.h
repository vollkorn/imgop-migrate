/*
 * interpolation.c
 *
 *  Created on: Aug 15, 2015
 *      Author: lukas
 */

#include <sys/types.h>

float lerp(float s, float e, float t);

float blerp(float c00, float c10, float c01, float c11, float tx, float ty);

void bilinear_interpolate(u_int8_t **in, u_int8_t **out, float **positions, int size_y, int size_x, int channels);
