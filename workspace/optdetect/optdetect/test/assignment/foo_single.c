/*
 * foo.c
 *
 *  Created on: Jul 6, 2015
 *      Author: lukas
 */


void foobar(int n, int m, float A[n][m]){

  for (int j = 0; j < n; ++j)
    for (int i = 0; i < m; ++i)
      A[i][j] = (i + 5) * 3 * j;
}
