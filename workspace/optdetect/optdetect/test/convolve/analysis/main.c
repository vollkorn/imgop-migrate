/*
 * main.c
 *
 *  Created on: Feb 18, 2015
 *      Author: lukas
 */

#include <stdlib.h>
#include <glib.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
#include <gtk/gtk.h>

#include "convolve.h"

#define FILENAME "4.2.04.tiff"
//#define FILENAME "lena512grey.bmp"

void on_destroy (GtkWidget *widget G_GNUC_UNUSED, gpointer user_data G_GNUC_UNUSED)
{
    gtk_main_quit ();
}

int main(int argc, char** argv)
{
    FILE *f;
    int m, n;
    GdkPixbuf *pixbuf;
    GtkWidget *window;
    GtkWidget *image;

    gtk_init (&argc, &argv);

    pixbuf = gdk_pixbuf_new_from_file(FILENAME, NULL);

    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
    image = gtk_image_new_from_pixbuf (pixbuf);
    gtk_container_add (GTK_CONTAINER (window), image);


    // apply filter

    guchar* pixel = gdk_pixbuf_get_pixels(pixbuf);

    int size_x = gdk_pixbuf_get_width(pixbuf);
    int size_y = gdk_pixbuf_get_height(pixbuf);

    int n_channels = gdk_pixbuf_get_n_channels(pixbuf);

    printf("Image\n X: %d \n Y: %d \n Channels: %d \n", size_x, size_y, n_channels);

    float kernel[] = {1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1,
                      };

    u_int8_t * img_greyscale_in = malloc(size_x * size_y * sizeof(unsigned char));
    u_int8_t * img_greyscale_out = malloc(size_x * size_y * sizeof(unsigned char));

    int pixpos = 0;
    for (n = 0; n < size_x; n++)
    {
        for (m = 0; m < size_y; m++)
        {
            int r = pixel[pixpos * n_channels    ];
            int g = pixel[pixpos * n_channels + 1];
            int b = pixel[pixpos * n_channels + 2];

            int grey = (r + g + b) / 3;

            img_greyscale_in[pixpos++] = (u_int8_t) grey;
        }
    }

//    convolve(img_greyscale_in, img_greyscale_out, kernel, size_x, size_y, 5);
    convolve_fixed_3_3(img_greyscale_in, img_greyscale_out, kernel, size_x, size_y);
    pixpos = 0;
    for (int y = 0; y < size_y; y++)
    {
        for (int x = 0; x < size_x; x++)
        {
            u_int8_t pixval = img_greyscale_out[pixpos];

            pixel[pixpos * n_channels    ] = pixval;
            pixel[pixpos * n_channels + 1] = pixval;
            pixel[pixpos * n_channels + 2] = pixval;

            pixpos++;
        }
    }



    gtk_widget_show_all (GTK_WIDGET (window));
    g_signal_connect (window, "destroy", G_CALLBACK(on_destroy), NULL);
    gtk_main ();

    free(img_greyscale_in);
    free(img_greyscale_out);

    return 0;
}
