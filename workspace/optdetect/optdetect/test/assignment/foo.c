/*
 * foo.c
 *
 *  Created on: Jul 6, 2015
 *      Author: lukas
 */


void foo(float A[10]){


	for(int i= 0; i < 10; ++i)
		A[i] = (i + 5) * 3 * i;

}


void bar(float A[10][10], int a, int b){

  for (int j = 0; j < 10; ++j)
    for (int i = 0; i < 10; ++i){

    	if(a > b)
    		A[i][j] = (i + 5) * 3 * j;
    	else
    		A[i][j] = (i + 5) * a * j;
    }
}


void foobar(int n, int m, float A[n][m]){

  for (int j = 0; j < n; ++j)
    for (int i = 0; i < m; ++i)
      A[i][j] = (i + 5) * 3 * j;
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
