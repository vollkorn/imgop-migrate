/*
 * foo.c
 *
 *  Created on: Jul 6, 2015
 *      Author: lukas
 */

// Test if a CF-Pattern can be found in a large function
// Pattern:
//
// for (int j = 0; j < n; ++j)
//    for (int i = 0; i < m; ++i)
//      A[i][j] = (i + 5) * 3 * j;
//

void foobar(int n, int m, float C[n][m], int tsteps, int X[1024 + 0][1024 + 0], int A[1024 + 0][1024 + 0],
            int B[1024 + 0][1024 + 0]) {
  int t, i1, i2;

  for (t = 0; t < tsteps; t++) {
    for (i1 = 0; i1 < n; i1++)
      for (i2 = 1; i2 < n; i2++) {
        X[i1][i2] = X[i1][i2] - X[i1][i2 - 1] * A[i1][i2] / B[i1][i2 - 1];
        B[i1][i2] = B[i1][i2] - A[i1][i2] * A[i1][i2] / B[i1][i2 - 1];
      }
  }

  // Pattern to find
  // -----------------------------------------------------------------
  //
  for (int j = 0; j < n; ++j)
    for (int i = 0; i < m; ++i)
      C[i][j] = (i + 5) * 3 * j;
  //
  // -----------------------------------------------------------------
  //

  for (i2 = 0; i2 < n; i2++)
    X[n - 1][i2] = X[n - 1][i2] / B[n - 1][i2];
}
