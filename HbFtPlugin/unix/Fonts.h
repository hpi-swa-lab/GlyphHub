#ifndef __FONTS_H__
#define __FONTS_H__

#include <ft2build.h>
#include <harfbuzz/hb.h>
#include <harfbuzz/hb-ft.h>

typedef struct {
	FT_Library ftlib;
} font_library_t;
font_library_t *font_library_new();
void font_library_free(font_library_t *l);

typedef struct {
	FT_Face ft_face;
	hb_font_t *hb_font;
} font_t;
font_t *font_load(font_library_t *lib, const char *file, int ptSize, int dpi);
void font_free(font_t *f);

typedef struct {
	uint8_t *data;
	int w;
	int h;
	int c;
} surface_t;
void surface_set_black(surface_t *s);
surface_t *surface_new_for_data(int w, int h, int c, uint8_t *data);
surface_t *surface_new(int w, int h, int c);
void surface_save_png(surface_t *s, const char *file);
void surface_free(surface_t *s);
void surface_free_externaldata(surface_t *s);
int surface_render_text(surface_t *surface, font_t *f, const char *text);

#endif // __FONTS_H__
