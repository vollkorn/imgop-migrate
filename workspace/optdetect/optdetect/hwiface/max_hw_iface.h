/*
 * max_hw_iface.h
 *
 *  Created on: Aug 17, 2015
 *      Author: lukas
 */

#ifndef HWIFACE_MAX_HW_IFACE_H_
#define HWIFACE_MAX_HW_IFACE_H_

#include <sys/types.h>

#define SLIC_REPO "/home/lfunke/overlays/"

#define ALLOW_HW "ALLOW_HW_MIGRATE"

#define MEASURE_EXECUTIONTIME_START                                                                                    \
  static struct timeval tm1, tm2;                                                                                      \
  gettimeofday(&tm1, NULL);

#define MEASURE_EXECUTIONTIME_STOP                                                                                     \
  gettimeofday(&tm2, NULL);                                                                                            \
  unsigned long long t = 1000 * (tm2.tv_sec - tm1.tv_sec) + (tm2.tv_usec - tm1.tv_usec) / 1000;                        \
  fprintf(stdout, "Done. Execution time (hw) %llu ms\n", t);

#define MEASURE_EXECUTIONTIME

#define OFFLOAD()                                                                                                      \
  u_int8_t do_offload = get_allow_hw_acceleration();                                                                   \
  if (!do_offload)                                                                                                     \
    return 1;

#define ALWAYS_OFFLOAD

//===--------------------       Affine transform        -------------------===//
//===----------------------------------------------------------------------===//

/// @param img_in	raw image input
/// @param img_out	raw image output
/// @param size_x	image size in x dimension
/// @param size_y	image size in y dimension
/// @param channel	number of channels (1 = grayscale, 3 = rgb, 4 = rgba)
/// @param M		transformation matrix ( 3 x 3 )
u_int8_t max_affine_transform_base(const u_int8_t *img_in, u_int8_t *img_out, u_int32_t size_x, u_int32_t size_y,
                                   float *M);

//===--------------------       Wrapper functions       -------------------===//
//===----------------------------------------------------------------------===//
u_int8_t max_affine_transform_1(const u_int8_t **img_in, u_int8_t **img_out, u_int32_t size_x, u_int32_t size_y,
                                float *M);

u_int8_t max_affine_transform_2(const u_int8_t *img_in, u_int8_t *img_out, u_int32_t size_x, u_int32_t size_y,
                                float M[3][3]);

u_int8_t max_affine_transform_3(const u_int8_t **img_in, u_int8_t **img_out, u_int32_t size_x, u_int32_t size_y,
                                float M[3][3]);

//===----------------------------------------------------------------------===//

//=== -----------------------       Convolution         -------------------===//
//===----------------------------------------------------------------------===//

// for grayscale
u_int8_t max_convolve_base_0(u_int8_t *src, u_int8_t *dst, float *kernel, int32_t filter_size, int32_t nx, int32_t ny, float scale);

// for rgb
u_int8_t max_convolve_base_1(u_int8_t *src, u_int8_t *dst, float *kernel, int32_t filter_size, int32_t nx, int32_t ny, float scale);

//===--------------------       Wrapper functions       -------------------===//
//===----------------------------------------------------------------------===//

u_int8_t max_convolve_1(u_int8_t **src, u_int8_t **dst, float *kernel, int32_t filter_size, int32_t nx, int32_t ny, float scale);

#endif /* HWIFACE_MAX_HW_IFACE_H_ */
