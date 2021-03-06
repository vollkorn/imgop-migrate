/*
 * transformation.c
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

// centrla: homogeneous coordinates

#include "transformations.h"

void matrix_multiply_double(int l, int m, int n, double A[l][m], double B[m][n], double C[l][n]) {

  int i, j, k;
  int D[100] = { 0 };
  for (i = 0; i < l; ++i)
    for (k = 0; k < n; ++k) {
      C[i][k] = 0;
      for (j = 0; j < m; ++j) {
        C[i][k] = C[i][k] + A[i][j] * B[k][j] * D[k];
      }
    }
}

void matrix_multiply_integer(int l, int m, int n, int A[l][m], int B[m][n], int C[l][n]) {

  int i, j, k;

  for (i = 0; i < l; ++i)
    for (k = 0; k < n; ++k) {
      C[i][k] = 0;
      for (j = 0; j < m; ++j) {
        C[i][k] = C[i][k] + A[i][j] * B[k][j];
      }
    }
}

void matrix_multiply_float(int l, int m, int n, float A[l][m], float B[m][n], float C[l][n]) {

  int i, j, k;

  for (i = 0; i < l; ++i)
    for (k = 0; k < n; ++k) {
      C[i][k] = 0;
      for (j = 0; j < m; ++j) {
        C[i][k] = C[i][k] + A[i][j] * B[k][j];
      }
    }
}

void transform_2d1(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, float M[3][3]) {

  int i = 0, j = 0;

  float T[3][1];
  float A[3][1];
  for (j = 0; j < ny; ++j)         // y dimension iteration
    for (i = 0; i < nx * 3; ++i) { // x dimension iteration

      A[0][0] = i;
      A[1][0] = j;
      A[2][0] = 1;

      matrix_multiply_float(3, 3, 1, M, A, T);

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

void transform_2d3(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, float M[3][3]) {

  int i = 0, j = 0;

  float T[3][1];
  float A[3][1];
  for (j = 0; j < ny; ++j)         // y dimension iteration
    for (i = 0; i < nx * 3; ++i) { // x dimension iteration

      A[0][0] = i;
      A[1][0] = j;
      A[2][0] = 1;

      matrix_multiply_float(3, 3, 1, M, A, T);

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

      for (int k = 0; k < 3; ++k)
        data_out[(int)y_][(int)x_ * 3 + k] = data_in[j][i * 3 + k];
    }
}

void transform_(u_int8_t **data_in, u_int8_t **data_out, float **positions, int nx, int ny, float M[3][3]) {

  int i = 0, j = 0;

  float T[3][1];
  float A[3][1];
  for (j = 0; j < ny; ++j)     // y dimension iteration
    for (i = 0; i < nx; ++i) { // x dimension iteration

      A[0][0] = i;
      A[1][0] = j;
      A[2][0] = 1;

      matrix_multiply_float(3, 3, 1, M, A, T);

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

      positions[j][i * 2] = x_;
      positions[j][i * 2 + 1] = y_;

      data_out[(int)y_][(int)x_] = data_in[j][i];
    }
}
