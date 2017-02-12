#include "sq.h"
#include "PangoPlugin.h"
#include <fontconfig/fontconfig.h>

PangoContext *context = NULL;
GSList *layouts = NULL;

static void _sqRegisterCustomFontLen(char *font) {
	FcConfigAppFontAddFile(FcConfigGetCurrent(), (const FcChar8 *) font);
}

static void _sqRegisterCustomFontDirectory(char *directory) {
	FcConfigAppFontAddFile(FcConfigGetCurrent(), (const FcChar8 *) directory);
}

void sqRegisterCustomFontLen(char *font, int len) {
	char *str = g_strndup(font, len);
	_sqRegisterCustomFontLen(str);
	g_free(str);
}

void sqRegisterCustomFontDirectory(char *directory, int len) {
	char *str = g_strndup(directory, len);
	_sqRegisterCustomFontDirectory(str);
	g_free(str);
}

static PangoContext *ensureContext() {
	if (context)
		return context;

	// IDEA: adding FileDirectory default upon init
	// _sqRegisterCustomFontLen("/home/tom/tmp/FontAwesome.otf");

	PangoFontMap *fontmap;

	fontmap = pango_cairo_font_map_get_default ();
	context = pango_font_map_create_context (fontmap);

	pango_cairo_context_set_resolution(context, 96);
	pango_context_set_language(context, pango_language_from_string("de"));
	pango_context_set_base_dir(context, PANGO_DIRECTION_LTR);

	cairo_font_options_t *font_options = cairo_font_options_create();
	cairo_font_options_set_hint_metrics(font_options, CAIRO_HINT_METRICS_ON);
	cairo_font_options_set_hint_style(font_options, CAIRO_HINT_STYLE_SLIGHT);
	cairo_font_options_set_subpixel_order(font_options, CAIRO_SUBPIXEL_ORDER_RGB);
	cairo_font_options_set_antialias(font_options, CAIRO_ANTIALIAS_SUBPIXEL);
	pango_cairo_context_set_font_options(context, font_options);

	return context;
}

void sqSetDpi(int dpi) {
	pango_cairo_context_set_resolution(ensureContext(), dpi);

	GSList *l = layouts;
	while (l) {
		pango_layout_context_changed(l->data);
		l = l->next;
	}
}

PangoLayout *sqCreateLayout() {
	PangoLayout *layout = pango_layout_new(ensureContext());
	layouts = g_slist_prepend(layouts, layout);
	return layout;
}

void sqPangoShutdown() {
	while (layouts) {
		g_object_unref(layouts->data);
		layouts = layouts->next;
	}
	g_slist_free(layouts);
	g_object_unref(context);
}

/* Given a layout, a start and end glyph index into its text, this function
 * emits several rectangles for the selection ranging from start to end via
 * its cb
 */
static void selection_rectangles(
		PangoLayout *layout,
		int start,
		int end,
		void (*cb)(double x, double y, double width, double height, void *userdata),
		void *userdata) {

	const char *text = pango_layout_get_text(layout);
	start = g_utf8_offset_to_pointer(text, start) - text;
	end = g_utf8_offset_to_pointer(text, end) - text;

	int lines = pango_layout_get_line_count(layout);

	for (int i = 0; i < lines; i++) {
		PangoLayoutLine *line;
		PangoRectangle start_rect;
		int n_ranges, *ranges, line_start, line_end;

		line = pango_layout_get_line_readonly(layout, i);
		pango_layout_line_x_to_index(line, G_MAXINT, &line_end, NULL);
		pango_layout_line_x_to_index(line, 0, &line_start, NULL);

		if (line_end < start)
			continue;

		pango_layout_line_get_x_ranges(line, start, end, &ranges, &n_ranges);
		pango_layout_index_to_pos(layout, line_start, &start_rect);

		for (int r = 0; r < n_ranges; r++) {
			double range_x = (double) ranges[r * 2] / PANGO_SCALE;
			double range_width = ((double) ranges[r * 2 + 1] - (double) ranges[r * 2]) / PANGO_SCALE;

			cb(range_x,
				PANGO_PIXELS(start_rect.y),
				range_width,
				PANGO_PIXELS(start_rect.height),
				userdata);
		}

		g_free(ranges);

		if (end >= line_start && end <= line_end)
			break;
	}
}

static void clip_rectangle(double x, double y, double width, double height, void *userdata) {
	cairo_t *cr = (cairo_t *) userdata;

	cairo_rectangle(cr, x, y, width, height);
}

static void set_source_rgba_from_uint(cairo_t *cr, unsigned int color) {
	double alpha = ((color & 0xFF000000) >> 24) / 255.0;
	double red   = ((color & 0x00FF0000) >> 16) / 255.0;
	double green = ((color & 0x0000FF00) >>  8) / 255.0;
	double blue  = ((color & 0x000000FF) >>  0) / 255.0;

	cairo_set_source_rgba(cr, red, green, blue, alpha);
}

void sqLayoutRenderWidthHeightDepthPointerTransformColorFillColorClipXClipYClipWidthClipHeightStartEnd(
		PangoLayout *layout,
		sqInt bmWidth,
		sqInt bmHeight,
		sqInt bmDepth,
		unsigned char *buffer,
		float *matrix,
		unsigned int color,
		unsigned int fillColor,
		float clipX,
		float clipY,
		float clipWidth,
		float clipHeight,
		int start,
		int end) {

	// TODO investigate initializing this only once
	cairo_surface_t *surface = cairo_image_surface_create_for_data(buffer,
			CAIRO_FORMAT_ARGB32,
			bmWidth,
			bmHeight,
			bmWidth * bmDepth / 8);

	cairo_t *cr = cairo_create(surface);
	cairo_matrix_t m;
	cairo_matrix_init(&m, matrix[0], matrix[3], matrix[1], matrix[4], matrix[2], matrix[5]);

	cairo_rectangle(cr, clipX, clipY, clipWidth, clipHeight);
	cairo_clip(cr);

	cairo_transform(cr, &m);

	if (start >= 0 || end >= 0) {
		selection_rectangles(layout, start, end, clip_rectangle, cr);
		set_source_rgba_from_uint(cr, fillColor);
		cairo_fill_preserve(cr);
		cairo_clip(cr);
	}

	set_source_rgba_from_uint(cr, color);
	pango_cairo_show_layout(cr, layout);

	cairo_surface_destroy(surface);
	cairo_destroy(cr);
}

