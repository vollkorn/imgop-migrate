/*
 * accumulate.h
 *
 *  Created on: Apr 29, 2015
 *      Author: lukas
 */

#ifndef OPTDETECT_TEST_ACCUMULATE_H_
#define OPTDETECT_TEST_ACCUMULATE_H_

#include <sys/types.h>

#include <stdio.h>
#include <stdlib.h>


//typedef u_int64_t int_type_t;
typedef int int_type_t;
//typedef u_int16_t int_type_t;
//typedef u_int8_t int_type_t;

void accumulate_1d_addr(const int_type_t *in, int_type_t *out,
        const int_type_t y, const int_type_t x,
        const int_type_t rowstride,
        const int_type_t s, const int_type_t w_size);

void accumulate_2d_addr(const int_type_t** in, int_type_t** out,
                        const int_type_t y, const int_type_t x, const int_type_t w_size);



#endif /* OPTDETECT_TEST_ACCUMULATE_H_ */
