#include "sq.h"
#include "PangoPlugin.h"

PangoContext *context = NULL;

PangoContext *ensureContext() {
	if (context)
		return context;

	PangoFontMap *fontmap;

	fontmap = pango_cairo_font_map_get_default ();
	context = pango_font_map_create_context (fontmap);

	pango_cairo_context_set_resolution (context, 96);
	pango_context_set_language(context, pango_language_from_string("de"));
	pango_context_set_base_dir (context, PANGO_DIRECTION_LTR);

	cairo_font_options_t *font_options = cairo_font_options_create();
	cairo_font_options_set_hint_metrics(font_options, CAIRO_HINT_METRICS_ON);
	cairo_font_options_set_hint_style(font_options, CAIRO_HINT_STYLE_SLIGHT);
	cairo_font_options_set_subpixel_order(font_options, CAIRO_SUBPIXEL_ORDER_RGB);
	cairo_font_options_set_antialias(font_options, CAIRO_ANTIALIAS_SUBPIXEL);
	pango_cairo_context_set_font_options(context, font_options);

	return context;
}

PangoLayout *sqCreateLayout() {
	return pango_layout_new(ensureContext());
}

cairo_surface_t *surface;

void sqLayoutRenderWidthHeightDepthPointerXYColor(
		PangoLayout *layout,
		sqInt bmWidth,
		sqInt bmHeight,
		sqInt bmDepth,
		unsigned char *buffer,
		double x,
		double y,
		sqInt color) {

	// TODO investigate initializing this only once
	surface = cairo_image_surface_create_for_data(buffer,
			CAIRO_FORMAT_ARGB32,
			bmWidth,
			bmHeight,
			bmWidth * bmDepth / 8);

	double alpha = (color & 0xFF000000 >> 24) / 255.0;
	double red = (color & 0x00FF0000 >> 16) / 255.0;
	double green = (color & 0x0000FF00 >> 8) / 255.0;
	double blue = (color & 0x000000FF) / 255.0;

	cairo_t *cr = cairo_create(surface);
	cairo_move_to(cr, x, y);
	cairo_set_source_rgba(cr, red, green, blue, alpha);
	pango_cairo_show_layout(cr, layout);

	cairo_surface_destroy(surface);
	cairo_destroy(cr);
}

