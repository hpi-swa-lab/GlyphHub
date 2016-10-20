#include "Fonts.h"

int main() {
	font_library_t *lib = font_library_new();
	if (!lib)
		return 1;

	surface_t *surface = surface_new(1024, 1024, 4);
	font_t *font = font_load(lib, "/usr/share/fonts/truetype/lobster-elementary/Lobster.ttf");

	surface_render_text(surface, lib, font, 64, 96 * 2, "Das ist ein Test!");
	surface_save_png(surface, "tests.png");

	surface_free(surface);
	font_free(font);
	font_library_free(lib);

	return 0;
}
