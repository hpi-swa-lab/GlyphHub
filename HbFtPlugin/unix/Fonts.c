#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

#include "Fonts.h"
#include FT_FREETYPE_H
#include FT_GLYPH_H
#include FT_OUTLINE_H

font_library_t *font_library_new() {
	font_library_t *l = (font_library_t *) malloc(sizeof(font_library_t));
	if (FT_Init_FreeType(&l->ftlib)) {
		free(l);
		return NULL;
	}
	return l;
}
void font_library_free(font_library_t *l) {
	FT_Done_FreeType(l->ftlib);
	free(l);
}


font_t *font_load(font_library_t *lib, const char *file, int ptSize, int dpi) {
	font_t *f = (font_t *) malloc(sizeof(font_t));
	assert(!FT_New_Face(lib->ftlib, file, 0, &f->ft_face));
	assert(!FT_Set_Char_Size(f->ft_face, 0, ptSize * 64, dpi, dpi));
	f->hb_font = hb_ft_font_create(f->ft_face, 0);
	return f;
}
void font_free(font_t *f) {
	hb_font_destroy(f->hb_font);
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

static void bitblt(surface_t *source, int sx, int sy, int width, int height,
		surface_t *dest, int dx, int dy, uint32_t (* f)(uint32_t)) {
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			uint32_t src = f(source->data[(sx + x + (sy + y) * source->w) * source->c]);
			int offset = (dx + x + (dy + y) * dest->w) * dest->c;
			memcpy(dest->data + offset, &src, dest->c);
		}
	}
}

static double _width_of_next_word(const char *first, const char *last, hb_glyph_position_t *p, int *word_length) {
	double distance = 0.0;
	*word_length = 0;
	while (first != last &&
			*first != ' ' &&
			*first != '.' &&
			*first != '!') {
		distance += p->x_advance / 64.0;
		p++;
		(*word_length)++;
		first++;
	}
	return distance;
}

static uint32_t blendColor(uint32_t src) {
	return src | (src << 8) | (src << 16) | (0xFF << 24);
}

int surface_render_text(surface_t *surface, font_t *f, const char *text) {
	hb_buffer_t *buf;
	unsigned int glyph_count;
	hb_glyph_info_t *glyph_infos;
	hb_glyph_position_t *glyph_positions;

	buf = hb_buffer_create();
	hb_buffer_set_content_type(buf, HB_BUFFER_CONTENT_TYPE_UNICODE);
	hb_buffer_add_utf8(buf, text, strlen(text), 0, strlen(text));
	hb_buffer_set_script(buf, HB_SCRIPT_LATIN);
	hb_buffer_guess_segment_properties(buf);

	glyph_count = hb_buffer_get_length(buf);
	glyph_infos = hb_buffer_get_glyph_infos(buf, &glyph_count);
	hb_shape(f->hb_font, buf, NULL, 0);
	glyph_positions = hb_buffer_get_glyph_positions(buf, &glyph_count);

	int maxHeight = (int) ((f->ft_face->size->metrics.ascender - f->ft_face->size->metrics.descender) / 64.0);
	int remaining_letters = 0;
	const char *currentChar = text;
	hb_glyph_position_t *currentGlyphPos = glyph_positions;
	const char *lastChar = text + strlen(text);
	double x = 0.0;
	double y = maxHeight;
	for (unsigned int i = 0; i < glyph_count; i++) {
		hb_codepoint_t codepoint = glyph_infos[i].codepoint;
		// auto index = FT_Get_Char_Index(f->ft_face, codepoint);

		if (remaining_letters < 0) {
			int width = _width_of_next_word(currentChar, lastChar, currentGlyphPos, &remaining_letters);
			if (width < surface->w && x + width > surface->w) {
				x = 0;
				y += maxHeight;
			}
		}

		FT_Load_Glyph(f->ft_face, codepoint, FT_LOAD_DEFAULT);
		FT_GlyphSlot glyph = f->ft_face->glyph;

		if (glyph->format == FT_GLYPH_FORMAT_OUTLINE) {
			FT_Render_Glyph(glyph, FT_RENDER_MODE_NORMAL);

			surface_t bitmap;
			bitmap.data = glyph->bitmap.buffer;
			bitmap.w = glyph->bitmap.width;
			bitmap.h = glyph->bitmap.rows;
			bitmap.c = 1;

			if (x + currentGlyphPos->x_advance / 64.0 > surface->w) {
				x = 0;
				y += maxHeight;
			}

			if (y + currentGlyphPos->y_advance / 64.0 > surface->h)
				return -1;

			bitblt(&bitmap,
					0,
					0,
					bitmap.w,
					bitmap.h,
					surface,
					x + currentGlyphPos->x_offset / 64.0 + glyph->bitmap_left,
					y - currentGlyphPos->y_offset / 64.0 - glyph->bitmap_top,
					&blendColor);
		}

		x += currentGlyphPos->x_advance / 64.0;
		y -= currentGlyphPos->y_advance / 64.0;
		currentChar++;
		currentGlyphPos++;
		remaining_letters--;
		assert(x < surface->w && y < surface->h);
	}

	// hb_buffer_clear_contents(buf);
	hb_buffer_destroy(buf);
	return 1;
}

