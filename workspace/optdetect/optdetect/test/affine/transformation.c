/*
 * transformation.c
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

// centrla: homogeneous coordinates

#include "transformations.h"

void foo(int l, int n, int m, int *R) {

  int i, j, k;
  for (i = 0; i < l; ++i)
    for (k = 0; k < n; ++k)
      for (j = 0; j < m; ++j)
        *R = *R + 1;
}

void matrix_multiply(int l, int m, int n, float A[l][m], float B[m][n], float C[l][n]) {

  int i, j, k;

  for (i = 0; i < l; ++i)
    for (k = 0; k < n; ++k) {
      C[i][k] = 0;
      for (j = 0; j < m; ++j) {
        C[i][k] = C[i][k] + A[i][j] * B[k][j];
      }
    }
}

 void transform(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, float M[3][3] ) {

  int i = 0, j = 0;

  float T[3][1];
  float A[3][1];
  for (j = 0; j < ny; ++j)     // y dimension iteration
    for (i = 0; i < nx; ++i) { // x dimension iteration

      A[0][0] = i;
      A[1][0] = j;
      A[2][0] = 1;

      matrix_multiply(3, 3, 1, M, A, T);

      float x_ = T[0][0];
      float y_ = T[1][0];

      // boundary checking
      if (x_ > nx - 1)
        x_ = nx - 1;
      if (x_ < 0)
        x_ = 0;
      if (y_ > ny - 1)
        y_ = ny - 1;
      if (y_ < 0)
        y_ = 0;

      data_out[(int)y_][(int)x_] = data_in[j][i];
    }
}

 void transform_(u_int8_t **data_in, u_int8_t **data_out, float** positions, int nx, int ny, float M[3][3] ) {

  int i = 0, j = 0;

  float T[3][1];
  float A[3][1];
  for (j = 0; j < ny; ++j)     // y dimension iteration
    for (i = 0; i < nx; ++i) { // x dimension iteration

      A[0][0] = i;
      A[1][0] = j;
      A[2][0] = 1;

      matrix_multiply(3, 3, 1, M, A, T);

      float x_ = T[0][0];
      float y_ = T[1][0];

      // boundary checking
      if (x_ > nx - 1)
        x_ = nx - 1;
      if (x_ < 0)
        x_ = 0;
      if (y_ > ny - 1)
        y_ = ny - 1;
      if (y_ < 0)
        y_ = 0;

      positions[j][i*2] = x_;
      positions[j][i*2 + 1] = y_;

      data_out[(int)y_][(int)x_] = data_in[j][i];
    }
}
