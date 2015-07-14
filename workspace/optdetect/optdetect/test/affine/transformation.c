/*
 * transformation.c
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

// centrla: homogeneous coordinates

#include "transformations.h"

void foo(int l, int n, int m, int* R){

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

//void transform(u_int8_t **data_in, u_int8_t **data_out, int nx, int ny, int l, int m, float M[l][m] ) {
//
//  int i = 0, j = 0;
//
//  float T[3][1] = { 0 };
//  float A[3][1] = { 0 };
//  for (j = 0; j < ny - 1; ++j)     // y dimension iteration
//    for (i = 0; i < nx - 1; ++i) { // x dimension iteration
//
//      A[0][0] = i;
//      A[1][0] = j;
//      A[2][0] = 1;
//
//      matrix_multiply(l, m, 1, M, A, T);
//
//      float __x = T[0][0];
//      float __y = T[1][0];
//
//      if (__x > nx - 1)
//        __x = nx - 1;
//      if (__x < 0)
//        __x = 0;
//      if (__y > ny - 1)
//        __y = ny - 1;
//      if (__y < 0)
//        __y = 0;
//
//      data_out[(int)__y][(int)__x] = data_in[j][i];
//    }
//}
