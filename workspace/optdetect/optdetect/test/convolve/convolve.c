//===-----------------           Convolution 2D         -------------------===//
//	Signature layout:
//	operation_dimension/channels_layout_inlining
//  E.g.
//    convolve_2d1_inline_2darr
// 	  - 2D convolution with one channel
//    - Kernel operation is inlined
//    - Array layout is 2 dimensional
//===----------------------------------------------------------------------===//

#include <sys/types.h>

#include "convolve.h"
#define min(X, Y) (((X) < (Y)) ? (X) : (Y))
#define max(X, Y) (((X) > (Y)) ? (X) : (Y))

//=== Convolution 2D on arrays with linear layout       -------------------===//
//  1 Channel
//===----------------------------------------------------------------------===//

void filter_kernel_2d1_1darr(const u_int8_t *in, u_int8_t *out, const float *kernel, const int kn, const int y,
                             const int x, const int size_x, const int size_y, float scale) {
  const int khalf = kn / 2;

  float pixel = 0.0;
  int c = 0;

  // actual filter operation
  for (int j = -khalf; j <= khalf; j++)
    for (int i = -khalf; i <= khalf; i++)
      pixel += in[(y - j) * size_x + x - i] * kernel[1 - j * kn + 1 - i];

  out[y * size_x + x] = (u_int8_t)(pixel / scale);
}

void convolve_2d1_noninline_1darr(const u_int8_t *in, u_int8_t *out, const float *kernel, const int kn, const int dim_x,
                                  const int dim_y, float scale) {
  const int khalf = kn / 2;

  for (int y = khalf; y < dim_y - khalf; y++) // iteration over image pixels
    for (int x = khalf; x < dim_x - khalf; x++)
      filter_kernel_2d1_1darr(in, out, kernel, kn, y, x, dim_x, dim_y, scale);
}

//===----------------------------------------------------------------------===//

//=== Convolution 2D on arrays with idirectional layout -------------------===//
//	1 Channel
//===----------------------------------------------------------------------===//

void filter_kernel_2d1_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int x,
                             const int y, float scale) {
  const int khalf = kn / 2;

  float pixel = 0.0;
  int c = 0;

  // actual filter operation
  for (int j = -khalf; j <= khalf; j++)
    for (int i = -khalf; i <= khalf; i++)
      pixel += in[y + j][x + i] * kernel[c++];

  out[y][x] = (u_int8_t)(pixel / scale);
}

void convolve_2d1_noninline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn,
                                  const int dim_x, const int dim_y, float scale) {
  const int khalf = kn / 2;

  for (int y = khalf; y < dim_y - khalf; y++) // iteration over image pixels
    for (int x = khalf; x < dim_x - khalf; x++)
      filter_kernel_2d1_2darr(in, out, kernel, kn, x, y, scale);
}

void convolve_2d1_inline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn, const int dim_x,
                               const int dim_y, float scale) {
  const int khalf = kn / 2;

  for (int y = khalf; y < dim_y - khalf; y++) // iteration over image pixels
    for (int x = khalf; x < dim_x - khalf; x++) {
      float pixel = 0.0;
      int c = 0;

      // actual filter operation
      for (int j = -khalf; j <= khalf; j++)
        for (int i = -khalf; i <= khalf; i++)
          pixel += in[y + j][x + i] * kernel[c++];

      out[y][x] = (u_int8_t)(pixel / scale);
    }
}

//===----------------------------------------------------------------------===//

//=== Convolution 2D on arrays with idirectional layout -------------------===//
//	3 Channel (r, g, b) encoded as u_int8_t
//  | r | g | b |
//===----------------------------------------------------------------------===//

void convolve_2d3_inline_2darr(const u_int8_t **in, u_int8_t **out, const float *kernel, const int kn,
                               const int dim_x, const int dim_y, float scale) {
  const int khalf = kn / 2;

  for (int y = khalf; y < dim_y - khalf; y++) // iteration over image pixels
    for (int x = khalf; x < dim_x - khalf; x++) {
      u_int32_t pixel = 0;
      int c = 0;
      float r = 0, g = 0, b = 0;
      // actual filter operation
      for (int j = -khalf; j <= khalf; j++) {
        for (int i = -khalf; i <= khalf; i++) {
          float kernel_val = kernel[c++];
          u_int32_t x_offset = 3*(x+i);
          u_int32_t r_ = in[y + j][x_offset];
          u_int32_t g_ = in[y + j][x_offset + 1];
          u_int32_t b_ = in[y + j][x_offset + 2];

          r += r_ * kernel_val;
          g += g_ * kernel_val;
          b += b_ * kernel_val;
        }
      }

      r = r / scale;
      g = g / scale;
      b = b / scale;

      out[y][x*3 + 0] = min(  max(((int)r), 0)  , 255);
      out[y][x*3 + 1] = min(  max(((int)g), 0)  , 255);
      out[y][x*3 + 2] = min(  max(((int)b), 0)  , 255);
    }
}
