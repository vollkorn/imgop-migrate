/*
 * arraccess.c
 *
 *  Created on: Apr 27, 2015
 *      Author: lukas
 */


void foo(long n, long m, double A[n][m]) {
   for (long i = 0; i < n; i++)
     for (long j = 0; j < m; j++)
       A[i][j] = 1.0;
 }


void bar(long n, long m, double A[n][m]) {

    long foo = 0;

    for (long i = 0; i < n; i++)
     for (long j = 0; j < m; j++)
        foo += A[i][j];
 }


void bla(long n, long m, double** A) {

    long foo = 0;

    for (long i = 0; i < n; i++)
     for (long j = 0; j < m; j++)
        foo += A[i][j];
 }
