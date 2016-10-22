#ifndef __FONTS_H__
#define __FONTS_H__

#include <ft2build.h>
#include <harfbuzz/hb.h>
#include <harfbuzz/hb-ft.h>
#include <fontconfig/fontconfig.h>

#include FT_FREETYPE_H
#include FT_CACHE_MANAGER_H

#define DEBUG(...) printf(__VA_ARGS__); printf("\n");

const char* ftGetErrorMessage(FT_Error err);

typedef struct {
	char *face_filename;
	int face_index;
	int cmap_index;
} font_t;
void font_free(font_t *f);

typedef struct {
	FT_Library ftlib;
	FTC_Manager ftmanager;
	FTC_SBitCache ftsbits_cache;
	FTC_CMapCache ftcmap_cache;
	FTC_ImageCache ftimage_cache;
	FTC_ScalerRec scaler;

	FcConfig *fc_config;

	hb_buffer_t *hb_buffer;

	font_t *fonts;
	int n_fonts;
	int max_fonts;
} font_library_t;
font_library_t *font_library_new();
font_t *font_load(font_library_t *lib, const char *file);
font_t *font_load_by_name(font_library_t *lib, const char *name);
void font_library_list_installed(font_library_t *lib, void (* f)(char *, char *, char *));
void font_library_free(font_library_t *l);

typedef struct {
	uint8_t *data;
	int w;
	int h;
	int c;
} surface_t;
surface_t *surface_new_for_data(int w, int h, int c, uint8_t *data);
surface_t *surface_new(int w, int h, int c);
void surface_set_black(surface_t *s);
void surface_set_transparent(surface_t *s);
void surface_save_png(surface_t *s, const char *file);
void surface_free(surface_t *s);
void surface_free_externaldata(surface_t *s);
int surface_render_text(surface_t *surface, font_library_t *lib, font_t *f, int ptSize, int dpi, const char *text);

#endif // __FONTS_H__
