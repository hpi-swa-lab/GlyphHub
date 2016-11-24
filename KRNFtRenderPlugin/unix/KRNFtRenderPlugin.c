#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <cairo/cairo.h>

#include <ft2build.h>
#include FT_FREETYPE_H
#include FT_OUTLINE_H

const char* ftGetErrorMessage(FT_Error err)
{
    #undef __FTERRORS_H__
    #define FT_ERRORDEF( e, v, s )  case e: return s;
    #define FT_ERROR_START_LIST     switch (err) {
    #define FT_ERROR_END_LIST       }
    #include FT_ERRORS_H
    return "(Unknown error)";
}

#include "sq.h"
#include "KRNFtRenderPlugin.h"

#ifndef unlikely
#define unlikely
#endif

typedef struct _spanner_baton_t {
	/* rendering part - assumes 32bpp surface */
	uint32_t *pixels; // set to the glyph's origin.
	uint32_t *first_pixel, *last_pixel; // bounds check
	uint32_t pitch;
	uint32_t rshift;
	uint32_t gshift;
	uint32_t bshift;
	uint32_t ashift;
} spanner_baton_t;

#define MIN(x, y) ((x) < (y) ? (x) : (y))

/* This spanner does read/modify/write, trading performance for accuracy.
   The color here is simply half coverage value in all channels,
   effectively mid-gray.
   Suitable for when artifacts mostly do come up and annoy.
   This might be optimized if one does rmw only for some values of x.
   But since the whole buffer has to be rw anyway, and the previous value
   is probably still in the cache, there's little point to. */
void spanner_rw(int y, int count, const FT_Span* spans, void *user) {
	spanner_baton_t *baton = (spanner_baton_t *) user;
	uint32_t *scanline = baton->pixels - y * ((int) baton->pitch / 4);
	if (unlikely scanline < baton->first_pixel)
		return;

	for (int i = 0; i < count; i++) {
		uint32_t color =
			/*((spans[i].coverage) << baton->rshift) |
			((spans[i].coverage) << baton->gshift) |
			((spans[i].coverage) << baton->bshift) |*/
			((spans[i].coverage) << baton->ashift);

		uint32_t *start = scanline + spans[i].x;
		if (unlikely start + spans[i].len > baton->last_pixel)
			return;

		uint32_t *end = MIN(start + spans[i].len, scanline + baton->pitch / 4);
		for (; start < end; start++)
			*start |= color;
	}
}

FT_SpanFunc spanner = spanner_rw;
FT_Library ft_library;
int inited = 0;

sqInt sqShutdown() {
	if (inited)
		FT_Done_FreeType(ft_library);
	inited = 0;
	return 0;
}

int init() {
	if (inited)
		return 1;

	if (FT_Init_FreeType(&ft_library))
		return 0;
	else {
		inited = 1;
		return 1;
	}
}

sqInt sqRenderContours(uint8_t *first_pixel,
		uint8_t *last_pixel,
		sqInt x,
		sqInt y,
		uint32_t pitch,
		sqInt n_contours,
		sqInt n_points,
		long *points,
		short *contours,
		char *tags) {

	FT_Error fterr;

	if (!init()) {
		printf("INIT FAILED D:\n");
		return 1;
	}

	spanner_baton_t stuffbaton;

	FT_Raster_Params ftr_params;
	ftr_params.target = 0;
	ftr_params.flags = FT_RASTER_FLAG_DIRECT | FT_RASTER_FLAG_AA;
	ftr_params.user = &stuffbaton;
	ftr_params.black_spans = 0;
	ftr_params.bit_set = 0;
	ftr_params.bit_test = 0;
	ftr_params.gray_spans = spanner;

	stuffbaton.pixels = ((uint32_t *) (first_pixel + y * pitch)) + x;
	stuffbaton.first_pixel = (uint32_t *) first_pixel;
	stuffbaton.last_pixel = (uint32_t *) last_pixel;
	stuffbaton.pitch = pitch;
	stuffbaton.ashift = 24;
	stuffbaton.rshift = 16;
	stuffbaton.gshift = 8;
	stuffbaton.bshift = 0;

	FT_Outline out;
	out.n_contours = n_contours;
	out.n_points = n_points;
	out.points = (FT_Vector *) points;
	out.contours = contours;
	out.flags = FT_OUTLINE_SMART_DROPOUTS | FT_OUTLINE_INCLUDE_STUBS;
	out.tags = tags;

	if ((fterr = FT_Outline_Render(ft_library, &out, &ftr_params))) {
		printf("FT_Outline_Render() failed err=%d (%s)\n", fterr, ftGetErrorMessage(fterr));
		return 1;
	}

	return 0;
}

