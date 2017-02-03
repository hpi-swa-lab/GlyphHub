#include "sq.h"
#include "PangoPlugin.h"

static char *str_nullterm(char *str, int len) {
	char *ntstr = malloc(sizeof(char) * (len + 1));
	strncpy(ntstr, str, len);
	ntstr[len] = '\0';
	return ntstr;
}

PangoContext *context = NULL;

PangoLayout *sqBitmapLayoutSizeWidthHeightDepthPointerStrLenPtsizeDpiFontLenXYColor(
		PangoLayout *layout,
		sqInt bmBitsSize,
		sqInt bmWidth,
		sqInt bmHeight,
		sqInt bmDepth,
		unsigned char *buffer,
		char *_str,
		int len,
		int ptSize,
		int dpi,
		char *_fontName,
		int fontNameLen,
		double x,
		double y,
		sqInt color) {

#if 0
	BENCH_INIT();
	BENCH_START();
	DEBUG("Start to render string on bitmap (%ix%i@%i), valid: %i",
			bmWidth,
			bmHeight,
			bmDepth,
			(int) !!lib);
#endif
	char *str = str_nullterm(_str, len);
	char *fontName = str_nullterm(_fontName, fontNameLen);

	// create context
	if (!context) {
		PangoFontMap *fontmap;

		fontmap = pango_cairo_font_map_get_default ();
		context = pango_font_map_create_context (fontmap);

		pango_cairo_context_set_resolution (context, dpi);
		pango_context_set_language(context, pango_language_from_string("de"));
		pango_context_set_base_dir (context, PANGO_DIRECTION_LTR);

		char *font = g_strdup_printf("%s %i", fontName, ptSize);
		pango_context_set_font_description (context, pango_font_description_from_string(font));
		g_free(font);

		cairo_font_options_t *font_options = cairo_font_options_create();
		cairo_font_options_set_hint_metrics(font_options, CAIRO_HINT_METRICS_ON);
		cairo_font_options_set_hint_style(font_options, CAIRO_HINT_STYLE_SLIGHT);
		cairo_font_options_set_subpixel_order(font_options, CAIRO_SUBPIXEL_ORDER_RGB);
		cairo_font_options_set_antialias(font_options, CAIRO_ANTIALIAS_SUBPIXEL);
		pango_cairo_context_set_font_options(context, font_options);
	}

	// create layout
	if (!layout)
		layout = pango_layout_new(context);

	pango_layout_set_text(layout, str, -1);

	// render layout
	// cairo_surface_t *surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 200, 200);
	cairo_surface_t *surface = cairo_image_surface_create_for_data(buffer, CAIRO_FORMAT_ARGB32, bmWidth, bmHeight, bmWidth * bmDepth / 8);
	cairo_t *cr = cairo_create(surface);
	cairo_move_to(cr, x, y);
	double alpha = (color & 0xFF000000 >> 24) / 255.0;
	double red = (color & 0x00FF0000 >> 16) / 255.0;
	double green = (color & 0x0000FF00 >> 8) / 255.0;
	double blue = (color & 0x000000FF) / 255.0;
	printf("%f %f %f %f\n", alpha, red, green, blue);
	cairo_set_source_rgba(cr, red, green, blue, alpha);
	pango_cairo_show_layout(cr, layout);

	cairo_surface_write_to_png(surface, "testing.png");

	free(str);
	free(fontName);

	// BENCH_END("Render of bitmap");

	return layout;
}

