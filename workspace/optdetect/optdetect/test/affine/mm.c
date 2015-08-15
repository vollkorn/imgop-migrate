/*
 * mm.c
 *
 *  Created on: Jul 31, 2015
 *      Author: lukas
 */




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
