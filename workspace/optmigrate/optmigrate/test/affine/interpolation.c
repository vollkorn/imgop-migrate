/*
 * interpolation.c
 *
 *  Created on: Aug 15, 2015
 *      Author: lukas
 */

#include "interpolation.h"

float lerp(float s, float e, float t) { return s + (e - s) * t; }
float blerp(float c00, float c10, float c01, float c11, float tx, float ty) {
  return lerp(lerp(c00, c10, tx), lerp(c01, c11, tx), ty);
}

void bilinear_interpolate(u_int8_t **in, u_int8_t **out, float **positions, int size_y, int size_x, int channels) {

  for (int i = 0; i < size_y; ++i)
    for (int j = 0; j < size_x ; ++j) {

      float x_ = positions[i][j * 2] / 1.5;
      float y_ = positions[i][j * 2 + 1] / 1.5;

      int jx = ((x_ + 1) > size_x - 1) ? (int)x_ - 1 : x_ ;
      int iy = ((y_ + 1) > size_y - 1) ? (int)y_ - 1 : y_ ;

      for (int k = 0; k < channels; ++k) {

        u_int8_t c00 = in[iy][jx * channels + k];
        u_int8_t c10 = in[iy][(jx + 1) * channels + k];
        u_int8_t c01 = in[iy + 1][(jx) * channels + k];
        u_int8_t c11 = in[iy + 1][(jx + 1) * channels + k];

        u_int8_t pixval = (u_int8_t)blerp(c00, c10, c01, c11, x_ - jx, y_ - iy);

        out[iy][jx * channels + k] = pixval;
      }
    }
}
