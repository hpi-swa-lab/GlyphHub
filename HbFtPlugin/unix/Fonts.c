#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

#include "Fonts.h"
#include FT_GLYPH_H
#include FT_OUTLINE_H
#include FT_CACHE_H

const char* ftGetErrorMessage(FT_Error err)
{
#undef __FTERRORS_H__
#define FT_ERRORDEF( e, v, s  )  case e: return s;
#define FT_ERROR_START_LIST     switch (err) {
#define FT_ERROR_END_LIST       }
#include FT_ERRORS_H
return "(Unknown error)";
}


static FT_Error face_requester(FTC_FaceID face_id,
		FT_Library library,
		FT_Pointer request_data,
		FT_Face *aface) {
	font_t *face = (font_t *) face_id;
	return FT_New_Face(library, face->face_filename, face->face_index, aface);
}

font_library_t *font_library_new() {
	font_library_t *l = (font_library_t *) malloc(sizeof(font_library_t));
	l->n_fonts = 0;
	l->max_fonts = 0;
	l->fonts = NULL;

	if (FT_Init_FreeType(&l->ftlib))
		goto clean;

	if (FTC_Manager_New(
			l->ftlib,
			0,  /* use default */
			0,  /* use default */
			0,  /* use default */
			&face_requester,
			NULL,
			&l->ftmanager))
		goto clean;

	if (FTC_SBitCache_New(l->ftmanager, &l->ftsbits_cache))
		goto clean;

	if (FTC_ImageCache_New(l->ftmanager, &l->ftimage_cache))
		goto clean;

    if (FTC_CMapCache_New( l->ftmanager, &l->ftcmap_cache))
		goto clean;

	l->hb_buffer = hb_buffer_create();

	l->fc_config = FcInitLoadConfigAndFonts();

	return l;
clean:
	free(l);
	return NULL;
}
void font_library_free(font_library_t *l) {
	int i;

	for (i = 0; i < l->n_fonts; i++)
		font_free(&l->fonts[i]);

	FT_Done_FreeType(l->ftlib);
	hb_buffer_destroy(l->hb_buffer);
	FcFini();
	free(l);
}

void font_library_list_installed(font_library_t *lib, void (* f)(char *, char *, char *)) {
	FcPattern* pat = FcPatternCreate();
	FcObjectSet* os = FcObjectSetBuild(FC_FAMILY, FC_STYLE, FC_FILE, (char *) 0);
	FcFontSet* fs = FcFontList(lib->fc_config, pat, os);

	for (int i = 0; fs && i < fs->nfont; i++) {
		FcPattern* font = fs->fonts[i];
		FcChar8 *file, *style, *family;
		if (FcPatternGetString(font, FC_FILE, 0, &file) == FcResultMatch &&
			FcPatternGetString(font, FC_FAMILY, 0, &family) == FcResultMatch &&
			FcPatternGetString(font, FC_STYLE, 0, &style) == FcResultMatch) {
			f(file, family, style);
			// printf("Filename: %s (family %s, style %s)\n", file, family, style);
		}
	}

	if (fs)
		FcFontSetDestroy(fs);
}

font_t *font_load_by_name(font_library_t *lib, const char *name) {
	FcResult res;
	FcPattern* pattern = FcNameParse((const FcChar8*) name);
	FcConfigSubstitute(lib->fc_config, pattern, FcMatchPattern);
	FcDefaultSubstitute(pattern);
	FcChar8* file = NULL;
	font_t *font = NULL;
	FcPattern* font_match = FcFontMatch(lib->fc_config, pattern, &res);

	if (font_match) {
		FcPatternGetString(font_match, FC_FILE, 0, &file);
		if (file)
			font = font_load(lib, (char *) file);
		FcPatternDestroy(font_match);
	}

	FcPatternDestroy(pattern);

	return font;
}

font_t *font_load(font_library_t *lib, const char *file) {
	int i;
	for (i = 0; i < lib->n_fonts; i++) {
		if (strcmp(file, lib->fonts[i].face_filename) == 0)
			return &lib->fonts[i];
	}

	if (lib->max_fonts == 0) {
		lib->max_fonts = 16;
		lib->fonts = calloc(sizeof(font_t), lib->max_fonts);
	} else if (lib->n_fonts >= lib->max_fonts) {
		lib->max_fonts *= 2;
		lib->fonts = realloc(lib->fonts, sizeof(font_t) * lib->max_fonts);
	}
	font_t *f = (font_t *) &lib->fonts[lib->n_fonts++];
	f->face_filename = strdup(file);
	f->face_index = 0;
	f->cmap_index = 0; // face->charmap ? FT_Get_Charmap_Index(face->charmap) : 0
	return f;
}
void font_free(font_t *f) {
	free(f->face_filename);
	free(f);
}

void surface_set_black(surface_t *s) {
	assert(s->c == 4);
	for (int i = 0; i < s->w * s->h * 4; i += 4) {
		s->data[i + 0] = 0;
		s->data[i + 1] = 0;
		s->data[i + 2] = 0;
		s->data[i + 3] = 0xFF;
	}
}
void surface_set_transparent(surface_t *s) {
	memset(s->data, 0, s->w * s->h * s->c);
}
surface_t *surface_new_for_data(int w, int h, int c, uint8_t *data) {
	surface_t *s = (surface_t *) malloc(sizeof(surface_t));
	s->data = data;
	s->w = w;
	s->h = h;
	s->c = c;
	return s;
}
surface_t *surface_new(int w, int h, int c) {
	surface_t *s = surface_new_for_data(w, h, c, (uint8_t *) malloc(w * h * c));
	surface_set_black(s);
	return s;
}
void surface_save_png(surface_t *s, const char *file) {
	stbi_write_png(file, s->w, s->h, s->c, s->data, s->w * s->c);
}
void surface_free(surface_t *s) {
	free(s->data);
	free(s);
}
void surface_free_externaldata(surface_t *s) {
	free(s);
}

/**
 * blit entire source into dest at dx,dy transforming each
 * value of source with f before adding onto source
 */
static void bitblt(surface_t *source, surface_t *dest, int dx, int dy, uint32_t (* f)(uint32_t)) {
	int x, y, sx, sy,
		left = dx < 0 ? 0 : dx,
		top = dy < 0 ? 0 : dy,
		right = (dx + source->w > dest->w) ? dest->w : dx + source->w,
		bottom = (dy + source->h > dest->h) ? dest->h : dy + source->h;

	for (x = left, sx = 0; x < right; x++, sx++) {
		for (y = top, sy = 0; y < bottom; y++, sy++) {
			uint32_t src = f(source->data[(sx + sy * source->w) * source->c]);
			int offset = (x + y * dest->w) * dest->c;
			uint32_t tmp;
			for (int i = 0; i < dest->c; i++) {
				tmp = dest->data[offset + i] + ((unsigned char *) &src)[i];
				if (tmp > 255)
					tmp = 255;
				dest->data[offset + i] = tmp;
			}
		}
	}
}

static uint32_t blendColor(uint32_t src) {
	return src | (src << 8) | (src << 16) | (0xFF << 24);
}

static FT_Error renderIndex(font_library_t *lib, FTC_ScalerRec *scaler, FT_ULong index, FT_Glyph *glyf, surface_t *bitmap, int *bitmap_left, int *bitmap_top) {
	FT_Error error;
	int width  = scaler->width;
	int height = scaler->height;

	if (!scaler->pixel) {
		width  = ((width * scaler->x_res + 36) / 72)  >> 6;
		height = ((height * scaler->y_res + 36) / 72) >> 6;
	}

	if (width < 48 && height < 48) {
		FTC_SBit sbit;
		*glyf = NULL;

		if ((error = FTC_SBitCache_LookupScaler(lib->ftsbits_cache,
				scaler,
				FT_LOAD_DEFAULT,
				index,
				&sbit,
				NULL)))
			return error;

		if (sbit->buffer) {
			bitmap->data = sbit->buffer;
			bitmap->w = sbit->width;
			bitmap->h = sbit->height;
			bitmap->c = 1;
			*bitmap_left = sbit->left;
			*bitmap_top = sbit->top;
		} else {
			bitmap->data = NULL;
			bitmap->w = 0;
			bitmap->h = 0;
			bitmap->c = 0;
		}
		return FT_Err_Ok;
	}

	if ((error = FTC_ImageCache_LookupScaler(lib->ftimage_cache,
			&lib->scaler,
			FT_LOAD_DEFAULT,
			index,
			glyf,
			NULL)))
		return error;

	if ((*glyf)->format == FT_GLYPH_FORMAT_OUTLINE)
		if ((error = FT_Glyph_To_Bitmap(glyf, FT_RENDER_MODE_NORMAL, NULL, 0)))
			return error;

	if ((*glyf)->format != FT_GLYPH_FORMAT_BITMAP)
		return 1;

	FT_BitmapGlyph bmg = (FT_BitmapGlyph) *glyf;
	bitmap->data = bmg->bitmap.buffer;
	bitmap->w = bmg->bitmap.width;
	bitmap->h = bmg->bitmap.rows;
	bitmap->c = 1;
	*bitmap_left = bmg->left;
	*bitmap_top = bmg->top;

	return FT_Err_Ok;
}

static double _width_of_next_word(hb_glyph_info_t *first, hb_glyph_info_t *last, hb_glyph_position_t *p, const char *text, int *word_length) {
#define UTF8_IS_WHITESPACE(x) (\
	(x >= 0x0009 && x <= 0x000D) ||	/* White_Space # Cc	<control-0009>..<control-000D> */\
	x == 0x0020 ||					/* White_Space # Zs	SPACE */                         \
	x == 0x0085 ||         			/* White_Space # Cc	<control-0085> */                \
	x == 0x00A0 ||					/* White_Space # Zs	NO-BREAK SPACE */                \
	x == 0x1680 ||					/* White_Space # Zs	OGHAM SPACE MARK */              \
	x == 0x2000 ||					/* White_Space # Zs	EN QUAD..HAIR SPACE */           \
	x == 0x2028 ||					/* White_Space # Zl	LINE SEPARATOR */                \
	x == 0x2029 ||					/* White_Space # Zp	PARAGRAPH SEPARATOR */           \
	x == 0x202F ||					/* White_Space # Zs	NARROW NO-BREAK SPACE */         \
	x == 0x205F ||					/* White_Space # Zs	MEDIUM MATHEMATICAL SPACE */     \
	x == 0x3000)					/* White_Space # Zs	IDEOGRAPHIC SPACE */

	double distance = 0.0;
	*word_length = 0;
	while (first != last && !UTF8_IS_WHITESPACE(text[first->cluster])) {
		distance += p->x_advance / 64.0;
		p++;
		(*word_length)++;
		first++;
	}
	return distance;
}

FT_Error surface_render_text(surface_t *surface, font_library_t *lib, font_t *f, int ptSize, int dpi, const char *text) {
	static const hb_feature_t hb_features[] = {
		{ HB_TAG('k','e','r','n'), 1, 0, -1  },
		{ HB_TAG('c','l','i','g'), 1, 0, -1  },
		{ HB_TAG('l','i','g','a'), 1, 0, -1  }
	};

	unsigned int glyph_count, maxHeight;
	int remainingLetters;
	hb_glyph_info_t *currentGlyphInfo, *lastGlyphInfo;
	hb_glyph_position_t *currentGlyphPos;
	hb_font_t *hb_font;
	FT_Face ft_face;
	FT_Size size;
	FT_Error error;
	double x, y;

	lib->scaler.face_id = f;
	lib->scaler.width  = (FT_UInt) ptSize * 64;
	lib->scaler.height = (FT_UInt) ptSize * 64;
	lib->scaler.pixel  = 0;
	lib->scaler.x_res  = dpi;
	lib->scaler.y_res  = dpi;

	if ((error = FTC_Manager_LookupFace(lib->ftmanager, lib->scaler.face_id, &ft_face)))
		return error;
	if ((error = FTC_Manager_LookupSize(lib->ftmanager, &lib->scaler, &size)))
		return error;

	hb_font = hb_ft_font_create(ft_face, NULL);
	hb_buffer_clear_contents(lib->hb_buffer);
	hb_buffer_set_content_type(lib->hb_buffer, HB_BUFFER_CONTENT_TYPE_UNICODE);
	hb_buffer_add_utf8(lib->hb_buffer, text, strlen(text), 0, strlen(text));
	hb_buffer_set_script(lib->hb_buffer, HB_SCRIPT_LATIN);
	hb_buffer_guess_segment_properties(lib->hb_buffer);

	hb_shape(hb_font, lib->hb_buffer, hb_features, sizeof(hb_features) / sizeof(hb_feature_t));

	currentGlyphPos = hb_buffer_get_glyph_positions(lib->hb_buffer, &glyph_count);
	currentGlyphInfo = hb_buffer_get_glyph_infos(lib->hb_buffer, NULL);
	lastGlyphInfo = currentGlyphInfo + glyph_count;

	maxHeight = (int) ((ft_face->size->metrics.ascender - ft_face->size->metrics.descender) / 64.0);
	remainingLetters = 0;
	x = 0.0;
	y = ft_face->size->metrics.ascender / 64.0;
	for (unsigned int i = 0; i < glyph_count; i++) {
		if (remainingLetters < 0) {
			int width = _width_of_next_word(currentGlyphInfo, lastGlyphInfo, currentGlyphPos, text, &remainingLetters);
			if (width < surface->w && x + width > surface->w) {
				x = 0;
				y += maxHeight;
			}
		}

		FT_Glyph glyph;
		int bitmap_left, bitmap_top;
		surface_t bitmap;
		renderIndex(lib, &lib->scaler, currentGlyphInfo->codepoint, &glyph, &bitmap, &bitmap_left, &bitmap_top);

		if (x + currentGlyphPos->x_advance / 64.0 > surface->w) {
			x = 0;
			y += maxHeight;
		}

		if (y + currentGlyphPos->y_advance / 64.0 > surface->h)
			return FT_Err_Raster_Overflow;

		if (bitmap.data) {
			bitblt(&bitmap,
					surface,
					x + currentGlyphPos->x_offset / 64.0 + bitmap_left,
					y - currentGlyphPos->y_offset / 64.0 - bitmap_top,
					&blendColor);
		}

		if (glyph)
			FT_Done_Glyph(glyph);

		x += currentGlyphPos->x_advance / 64.0;
		y -= currentGlyphPos->y_advance / 64.0;
		currentGlyphPos++;
		currentGlyphInfo++;
		remainingLetters--;
	}

	hb_font_destroy(hb_font);
	return FT_Err_Ok;
}

