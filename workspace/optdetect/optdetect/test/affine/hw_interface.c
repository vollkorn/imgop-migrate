/*
 * Convolve_hw_interface.c
 *
 *  Created on: Jun 10, 2015
 *      Author: lukas
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <dlfcn.h>
#include <string.h>

#include <MaxSLiCInterface.h>
#define HOME "/home/lfunke/overlays/"

const char *libfilename_3_3  = HOME "slic_convolution_3_3.so";

const char *libfilename_5_5  = HOME "slic_convolution_5_5.so";

const char *libfilename_7_7  = HOME "slic_convolution_7_7.so";

const char* env_allow_hw = "ALLOW_OP_MIGRATE";

void convolve_bypass_hw_iface0(u_int8_t *src, u_int8_t *dst, float *kernel, int32_t filter_size, int32_t nx,
                               int32_t ny);

void convolve_bypass_hw_iface1(u_int8_t **src, u_int8_t **dst, float *kernel, int32_t filter_size, int32_t nx,
                               int32_t ny);

bool convolve_hw_use_accelerator(int32_t filter_size, int32_t nx, int32_t ny);

bool convolve_hw_use_accelerator(int32_t filter_size, int32_t nx, int32_t ny) {
  u_int8_t allow_hw = 0;

  char *pAllowHWAccelerationEnv = getenv(env_allow_hw);
  if (pAllowHWAccelerationEnv) {
    allow_hw = strtol(pAllowHWAccelerationEnv, NULL, 10);
  }

  if (allow_hw) {
    printf("Filter size %d, nx: %d, ny: %d\n", filter_size, nx, ny);
    if (nx >= 10 && ny >= 10)
      if (filter_size > 2)
        return true;
  }

  return false;
}

void convolve_bypass_hw_iface0(u_int8_t *src, u_int8_t *dst, float *kernel, int32_t filter_size, int32_t nx,
                               int32_t ny) {

  printf("HW bypass 0 called\n");
  printf("Parameters:\nsrc: %p\ndst: %p\nkernel: %p\nFilter size: %d\nData size x: %d\nData size y: %d\n", src, dst,
         kernel, filter_size, nx, ny);
}
void convolve_bypass_hw_iface1(u_int8_t **src, u_int8_t **dst, float *kernel, int32_t filter_size, int32_t nx,
                               int32_t ny) {
  char *error;

  printf("HW bypass 1 called\n");
  printf("Parameters:\nsrc: %p\ndst: %p\nkernel: %p\nFilter size: %d\nData size x: %d\nData size y: %d\n", src, dst,
         kernel, filter_size, nx, ny);

  const char *libfile;
  if (filter_size == 3){
	  libfile = libfilename_3_3;
  } else if (filter_size == 5){
	  libfile = libfilename_5_5;
  }else if (filter_size == 7){
	  libfile = libfilename_7_7;
  }
  else{
	  printf("No maxfile for filter size: %d\n", filter_size);
	  return;
  }
  // make array linear
  u_int8_t *in = malloc(sizeof(u_int8_t) * nx * ny);
  u_int8_t *out = malloc(sizeof(u_int8_t) * nx * ny);

  int i = 0, j = 0;
  for (i = 0; i < ny; ++i)
    memcpy(&in[i * nx], src[i], sizeof(u_int8_t) * nx);

  void (*ifaceptr)(int64_t param_N, int32_t param_size_x, int32_t param_size_y, const float * param_coeff,
                   const u_int8_t * instream_data_in, u_int8_t * outstream_data_out);

  max_file_t *(*max_init)();

  void *dlhandle = dlopen(libfile, RTLD_LAZY | RTLD_GLOBAL);

  if (!dlhandle) {
    error = dlerror();
    printf("Could not load shared library! %s\n", error);
    return;
  }

  // get symbols
  ifaceptr = dlsym(dlhandle, "MemStream");
  if ((error = dlerror()) != NULL) {
    printf("Could not find interface: %s \n", error);
    return;
  }

  max_init = dlsym(dlhandle, "MemStream_init");
  if ((error = dlerror()) != NULL) {
    printf("Could not find interface: %s \n", error);
    return;
  }

  printf("Initializing DFE\n");

  //  max_file_t* maxfile = (*max_init)();

  (*ifaceptr)(nx * ny, nx, ny, kernel, in, out);

  printf("DFE finished\n");

  dlclose(dlhandle);

  for (i = 0; i < ny; ++i)
    memcpy(dst[i], &out[i * nx], sizeof(u_int8_t) * nx);

  free(in);
  free(out);

  //	 copy data so maxeler machine
  //
  //	 load DFE	(takes 100ms - 1s)
  //
  //	 do caching here -> do not unload until another max file is required
  //
  //	 run on data
  //
  //	 return
}
