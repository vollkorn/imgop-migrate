/*
 * max_hw_iface.c
 *
 *  Created on: Aug 17, 2015
 *      Author: lukas
 */

#include "max_hw_iface.h"

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <dlfcn.h>
#include <string.h>

#include <sys/time.h>

#include <MaxSLiCInterface.h>

u_int8_t max_is_loaded(max_file_t *maxfile) {

  //	maxfile->maxfile_internal
  return 1;
}

static inline bool get_allow_hw_acceleration() {

#ifdef ALWAYS_OFFLOAD
  return 1;
#else
  u_int8_t allow_hw = 0;

  char *pAllowHWAccelerationEnv = getenv(ALLOW_HW);
  if (pAllowHWAccelerationEnv) {
    allow_hw = strtol(pAllowHWAccelerationEnv, NULL, 10);
  }

  return allow_hw;
#endif
}

void max_close_interface(void *dlhandle) { dlclose(dlhandle); }

void *max_open_interface(const char *ifacename, const char *lib, void **ifaceptr, max_file_t **maxfile) {

  max_file_t *(*max_init)();

  fprintf(stderr, "Trying to open %s...\n", lib);

  char *error;
  void *dlhandle = dlopen(lib, RTLD_LAZY | RTLD_GLOBAL);

  if (!dlhandle) {
    error = dlerror();
    fprintf(stderr, "Could not load shared library! %s\n", error);
    return NULL;
  }

  *ifaceptr = dlsym(dlhandle, ifacename);
  if ((error = dlerror()) != NULL) {
    fprintf(stderr, "Could not find interface: %s \n", error);
    return NULL;
  }

  char init_name[1024];

  sprintf(init_name, "%s_init", ifacename);

  max_init = dlsym(dlhandle, init_name);
  if ((error = dlerror()) != NULL) {
    printf("Could not find interface: %s \n", error);
    return NULL;
  }

  (*maxfile) = max_init();

  unsigned engines_present = max_count_engines_present(*maxfile, "local:0");

  fprintf(stderr, "Engines compatible: %d\n", engines_present);

  if (engines_present < 1) {
    max_file_free(*maxfile);
    max_close_interface(dlhandle);
    return NULL;
  }

  return dlhandle;
}

u_int8_t max_affine_transform_1(const u_int8_t **img_in, u_int8_t **img_out, u_int32_t size_x, u_int32_t size_y,
                                float *M) {

  return 1;
}

u_int8_t max_affine_transform_2(const u_int8_t *img_in, u_int8_t *img_out, u_int32_t size_x, u_int32_t size_y,
                                float M[3][3]) {

  float M_[9] = { M[0][0], M[0][1], M[0][2], M[1][0], M[1][1], M[1][2], M[2][0], M[2][1], M[2][2] };
  return max_affine_transform_base(img_in, img_out, size_x, size_y, &M_[0], 1);
}

u_int8_t max_affine_transform_3(const u_int8_t **img_in, u_int8_t **img_out, u_int32_t size_x, u_int32_t size_y,
                                float M[3][3]) {

  u_int8_t do_offload = get_allow_hw_acceleration();

  if (!do_offload)
    return 1;

  float M_[9] = { M[0][0], M[0][1], M[0][2], M[1][0], M[1][1], M[1][2], M[2][0], M[2][1], M[2][2] };

  int channel = 3;

  u_int8_t *in = malloc(sizeof(u_int8_t) * size_x * size_y * channel);
  u_int8_t *out = malloc(sizeof(u_int8_t) * size_x * size_y * channel);

  // linearize
  for (int j = 0; j < size_y; ++j) {
    for (int i = 0; i < size_x * channel; i += channel) {

      for (int k = 0; k < 3; ++k)
        in[j * size_x * channel + i] = img_in[j][i + k];
    }
  }

  max_affine_transform_base(in, out, size_x, size_y, &M_[0], channel);

  // delinearize
  for (int j = 0; j < size_y; ++j) {
    for (int i = 0; i < size_x * channel; i += channel) {

      for (int k = 0; k < 3; ++k)
        img_out[j][i + k] = out[j * size_x * channel + i];
    }
  }

  return 1;
}

u_int8_t max_affine_transform_base(const u_int8_t *img_in, u_int8_t *img_out, u_int32_t size_x, u_int32_t size_y,
                                   float *M, int channel) {

  OFFLOAD()

#ifdef MEASURE_EXECUTIONTIME
  MEASURE_EXECUTIONTIME_START
#endif

  int32_t *pix_pos = malloc(size_x * 2 * size_y * sizeof(int32_t));

  void (*ifaceptr)(int32_t param_size_x, int32_t param_size_y, const float * param_M, int32_t * outstream_data_out);

  char libfile[1024];
  sprintf(libfile, "%s/slic_%s.so", SLIC_REPO, "AffineTransform");
  max_file_t *maxfile;
  void *dlhandle = max_open_interface("AffineTransform", libfile, (void **)&ifaceptr, &maxfile);

  if (NULL == dlhandle || NULL == ifaceptr)
    return 1;

  fprintf(stderr, "Executing operation on hardware...\n");

  (*ifaceptr)(size_x, size_y, &M[0], pix_pos);

  max_close_interface(dlhandle);

  for (u_int32_t i = 0; i < size_y; ++i) {
    for (u_int32_t j = 0; j < size_x; ++j) {
      int x_ = pix_pos[2 * (i * size_x + j)];
      int y_ = pix_pos[2 * (i * size_x + j) + 1];

      int offset  = channel * (i * size_x + j);
      int offset_ = channel * (y_ * size_x + x_);

      for (int k = 0; k < channel; ++i) {
        img_out[offset_ +k] = img_in[offset + k];
      }
    }
  }

  free(pix_pos);

#ifdef MEASURE_EXECUTIONTIME
  MEASURE_EXECUTIONTIME_STOP
#endif

  return 0;
}

//===----------------------------------------------------------------------------------------------------===//
//===----------------------------------------------------------------------------------------------------===//

float *convert_filter(int from, int to, float *kernel_in, float *scale) {

  if (from > to) {
    fprintf(stderr, "Could not convert filter. Invalid size: %d > %d", from, to);
    return NULL;
  } else if (from == to) {
    return kernel_in;
  }

  int gap = (to - from) / 2;

  float *kernel_out = malloc(sizeof(float) * to * to);

  for (int i = 0; i < to; ++i)
    for (int j = 0; j < to; ++j) {

      if ((j > gap && j < to - gap) && (i > gap && i < to - gap)) {
        kernel_out[i * to + j] = kernel_in[i - gap * from + j - gap];
      } else
        kernel_out[i * to + j] = 1;
    }

  return kernel_out;
}

u_int8_t max_convolve_base_0(u_int8_t *src, u_int8_t *dst, float *kernel, int32_t filter_size, int32_t nx, int32_t ny,
                             float scale) {

  if (nx > MAX_SIZE_X || ny > MAX_SIZE_Y)
    return 1;
#ifdef INCLUDE_OFFLOAD_DECISION

  static int filter_threshold[25];

  filter_threshold[3] = INT32_MAX;
  filter_threshold[5] = INT32_MAX;
  filter_threshold[7] = 4096 * 2160;
  filter_threshold[9] = 4096 * 2160;
  filter_threshold[11] = 1920 * 1080;
  filter_threshold[13] = 1920 * 1080;

  if (nx * ny < filter_threshold[filter_size])
    return 1;
#endif

  OFFLOAD()

#ifdef MEASURE_EXECUTIONTIME
  MEASURE_EXECUTIONTIME_START
#endif

  int32_t window_size = filter_size * filter_size;

  double *kernel_ = malloc(sizeof(double) * window_size);
  for (int i = 0; i < window_size; ++i)
    kernel_[i] = (double)kernel[i];

  void (*ifaceptr)(float scale, int32_t param_size_x, int32_t param_size_y, const double * param_coeff,
                   const u_int8_t * instream_data_in, u_int8_t * outstream_data_out);

  char libfile[1024];
  sprintf(libfile, "%s/slic_%s_%d_%d.so", SLIC_REPO, "convolution", filter_size, filter_size);

  max_file_t *maxfile;

  void *dlhandle = max_open_interface("MemStream", libfile, (void **)&ifaceptr, &maxfile);

  if (NULL == dlhandle || NULL == ifaceptr)
    return 1;

  fprintf(stderr, "Executing operation on hardware...\n");

  (*ifaceptr)(scale, nx, ny, kernel_, src, dst);

  max_close_interface(dlhandle);

#ifdef MEASURE_EXECUTIONTIME
  MEASURE_EXECUTIONTIME_STOP
#endif
  free(kernel_);
  return 0;
}

u_int8_t max_convolve_1(u_int8_t **src, u_int8_t **dst, float *kernel, int32_t filter_size, int32_t nx, int32_t ny,
                        float scale) {

  OFFLOAD()

  u_int8_t *in = malloc(sizeof(u_int8_t) * nx * ny);
  u_int8_t *out = malloc(sizeof(u_int8_t) * nx * ny);

  u_int8_t retval = 1;

  for (u_int32_t i = 0; i < ny; ++i)
    memcpy(&in[i * nx], src[i], sizeof(u_int8_t) * nx);

  retval = max_convolve_base_0(in, out, kernel, filter_size, nx, ny, scale);

  if (!retval)
    for (u_int32_t i = 0; i < ny; ++i)
      memcpy(dst[i], &out[i * nx], sizeof(u_int8_t) * nx);

  free(in);
  free(out);

  return retval;
}
