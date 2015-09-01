/*
 * jpeg.c
 *
 *  Created on: Jun 25, 2015
 *      Author: lukas
 */

#include "jpeg.h"

void free_array_2d(size_t nrows, u_int8_t **arr) {
  for (int i = 0; i < nrows; i++) {
    free(arr[i]);
  }
  free(arr);
}

u_int8_t **create_image_2d(size_t size_y, size_t size_x, size_t channels, u_int8_t init) {
  u_int8_t **foo = (u_int8_t **)malloc(sizeof(u_int8_t *) * size_y);

  for (int i = 0; i < size_y; i++) {
    foo[i] = (u_int8_t *)malloc(sizeof(u_int8_t) * size_x * channels);

    for (int j = 0; j < size_x; j++) {
      for (int k = 0; k < channels; k++) {
        foo[i][j * channels + k] = init;
      }
    }
  }
  return foo;
}

u_int8_t **create_image_2d_rand(size_t size_y, size_t size_x, size_t channels) {
  u_int8_t **foo = (u_int8_t **)malloc(sizeof(u_int8_t *) * size_y);

  u_int8_t rgb[channels];
  for (int i = 0; i < size_y; i++) {
    foo[i] = (u_int8_t *)malloc(sizeof(u_int8_t) * size_x * channels);

    for (int j = 0; j < size_x; j++) {

      if (i % 64 == 0 && j % 64 == 0) {
        for (int k = 0; k < channels; k++) {
          rgb[k] = random() % 255;
        }
      }

      for (int k = 0; k < channels; k++) {
        foo[i][j * channels + k] = rgb[k];
      }
    }
  }
  return foo;
}

void arr_set_value(u_int8_t **arr, size_t nrows, size_t ncols, u_int8_t val) {
  for (int i = 0; i < nrows; i++)
    for (int j = 0; j < ncols; j++) {
      arr[i][j] = val;
    }
}

void arr_copy(u_int8_t **src, u_int8_t **dst, size_t ny, size_t nx, size_t channels) {
  for (int i = 0; i < ny; i++)
    memcpy(dst[i], src[i], sizeof(u_int8_t) * nx * channels);
}

int jpeg_decompress(u_int8_t ***data, u_int32_t *nx, u_int32_t *ny, u_int32_t *nc, const char *filename) {

  FILE *infile;
  struct jpeg_error_mgr err;
  struct jpeg_decompress_struct cinfo;

  /* create decompressor */
  cinfo.err = jpeg_std_error(&err);

  jpeg_create_decompress(&cinfo);

  if ((infile = fopen(filename, "rb")) == NULL) {
    fprintf(stderr, "Can't open %s\n", filename);
    return 1;
  }

  /* set source buffer */
  jpeg_stdio_src(&cinfo, infile);

  /* read jpeg header */
  jpeg_read_header(&cinfo, true);

  /* decompress */
  jpeg_start_decompress(&cinfo);

  *nx = cinfo.output_width;
  *ny = cinfo.output_height;
  *nc = cinfo.out_color_components;

  if (*nc > 4 || *nc == 0) {
    fprintf(stderr, "Number of channels not supported: %d\n", *nc);

    jpeg_abort_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    fclose(infile);
    return 1;
  }

  if (*nx == 0 && *ny == 0) {
    jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    fprintf(stderr, "Image empty\n");
    return 1;
  }

  u_int8_t **pixmap = create_image_2d(*ny, *nx, *nc, 0);

  /* read scanlines */
  while (cinfo.output_scanline < cinfo.output_height)
    jpeg_read_scanlines(&cinfo, (JSAMPARRAY) & pixmap[cinfo.output_scanline], 1);

  *data = pixmap;

  /* clean up */
  jpeg_finish_decompress(&cinfo);
  jpeg_destroy_decompress(&cinfo);
  fclose(infile);
  return 0;
}

int jpeg_compress(u_int8_t **data, u_int32_t nx, u_int32_t ny, u_int32_t nc, const char *filename) {

  FILE *outfile = fopen(filename, "wb");

  if (!outfile) {
    fprintf(stderr, "can't open: %s", filename);
    return 1;
  }
  struct jpeg_compress_struct cinfo;
  struct jpeg_error_mgr jerr;

  cinfo.err = jpeg_std_error(&jerr);
  jpeg_create_compress(&cinfo);
  jpeg_stdio_dest(&cinfo, outfile);

  cinfo.image_width = nx;
  cinfo.image_height = ny;
  cinfo.input_components = nc;
  if (nc == 1)
    cinfo.in_color_space = JCS_GRAYSCALE;
  else if (nc == 3)
    cinfo.in_color_space = JCS_RGB;
  else if (nc == 4)
    cinfo.in_color_space = JCS_EXT_RGBA;
  else {
    fprintf(stderr, "Cannot handle color space, channels: %d", nc);
    return 1;
  }

  jpeg_set_defaults(&cinfo);
  /*set the quality [0..100]  */
  jpeg_set_quality(&cinfo, 90, true);
  jpeg_start_compress(&cinfo, true);

  JSAMPROW row_pointer; /* pointer to a single row */

  while (cinfo.next_scanline < cinfo.image_height) {
    row_pointer = (JSAMPROW)data[cinfo.next_scanline];
    jpeg_write_scanlines(&cinfo, &row_pointer, 1);
  }
  jpeg_finish_compress(&cinfo);
  fclose(outfile);

  return 0;
}
