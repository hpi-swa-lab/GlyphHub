#include "sq.h"
#include "HbFtPlugin.h"

font_library_t *lib;

font_library_t *sqFontLibraryGet() {
	return lib;
}

sqInt sqFontLibraryInit() {
	lib = font_library_new();
	DEBUG("ft library init %s", lib ? "success" : "failure");
	return lib ? 1 : 0;
}

sqInt sqFontLibraryShutdown() {
	DEBUG("ft library free");
	if (lib)
		font_library_free(lib);
	return 1;
}

sqInt sqRenderStringLen(char *srcPtr, sqInt srcLen) {
	if (!lib)
		return 0;

	char *str = malloc(sizeof(char) * (srcLen + 1));
	strncpy(str, srcPtr, srcLen);
	str[srcLen] = 0;

	surface_t *surface = surface_new(400, 600, 4);
	font_t *font = font_load(lib, "/usr/share/fonts/truetype/roboto/hinted/Roboto-Bold.ttf");

	surface_render_text(surface, lib, font, 12, 96 * 2, str);
	surface_save_png(surface, "fonts.png");

	free(str);
	surface_free(surface);
	font_library_free(lib);

	return 1;
}

static char *str_nullterm(char *str, int len) {
	char *ntstr = malloc(sizeof(char) * (len + 1));
	strncpy(ntstr, str, len);
	ntstr[len] = '\0';
	return ntstr;
}

sqInt sqGetFontMetrics(char *_fontName, int fontNameLen, int ptSize, int dpi, int *ascender, int *descender, int *height, int *max_advance) {
	if (!lib)
		return 0;

	char *fontName = str_nullterm(_fontName, fontNameLen);
	font_t *f = font_load_by_name(lib, fontName);
	font_get_metrics(lib, f, ptSize, dpi, ascender, descender, height, max_advance);
	free(fontName);
	return 1;
}

sqInt sqFontMeasureWidth(char *_fontName, int fontNameLen, int ptSize, int dpi, char *_string, int stringLen) {
	BENCH_INIT();
	BENCH_START();
	if (!lib)
		return -1;


	char *fontName = str_nullterm(_fontName, fontNameLen);
	char *string = str_nullterm(_string, stringLen);

	DEBUG("Measuring width of `%s` for %s", string, fontName);

	font_t *f = font_load_by_name(lib, fontName);
	int width = font_measure_width(lib, f, ptSize, dpi, string);
	free(fontName);
	free(string);
	BENCH_END("Measuring width");

	return width;
}

sqInt sqBitmapTestWidthHeightDepthPointerStrLenPtsizeDpiFontLenForegroundBackground(
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
		int foreground,
		int background) {

	BENCH_INIT();
	BENCH_START();
	DEBUG("Start to render string on bitmap (%ix%i@%i), valid: %i",
			bmWidth,
			bmHeight,
			bmDepth,
			(int) !!lib);

	if (!lib)
		return 0;

	char *str = str_nullterm(_str, len);
	char *fontName = str_nullterm(_fontName, fontNameLen);

	surface_t *surface = surface_new_for_data(bmWidth, bmHeight, bmDepth / 8, buffer);
	surface_set_transparent(surface);
	font_t *font = font_load_by_name(lib, fontName);

	surface_render_text(surface, lib, font, ptSize, dpi, str);

	free(str);
	free(fontName);
	surface_free_externaldata(surface);

	BENCH_END("Render of bitmap");

	return 1;
}

sqInt sqBitmapTestWidthHeightDepthPointerStrLenPtsizeDpiFontLen(
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
		int fontNameLen) {

	BENCH_INIT();
	BENCH_START();
	DEBUG("Start to render string on bitmap (%ix%i@%i), valid: %i",
			bmWidth,
			bmHeight,
			bmDepth,
			(int) !!lib);

	if (!lib)
		return 0;

	char *str = str_nullterm(_str, len);
	char *fontName = str_nullterm(_fontName, fontNameLen);

	surface_t *surface = surface_new_for_data(bmWidth, bmHeight, bmDepth / 8, buffer);
	surface_set_transparent(surface);
	font_t *font = font_load_by_name(lib, fontName);

	surface_render_text(surface, lib, font, ptSize, dpi, str);

	free(str);
	free(fontName);
	surface_free_externaldata(surface);

	BENCH_END("Render of bitmap");

	return 1;
}

sqInt sqBitmapTestWidthHeightDepthPointerReal(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, sqInt bmBits, unsigned char *r) {
	printf("%i %i %i %i %p %p\n", bmBitsSize, bmWidth, bmHeight, bmDepth, (void *) bmBits, r);
	int bytesPerPixel = bmDepth / 8;
	// BGRA format
	for (int i = 0; i < bmWidth * bmWidth * bytesPerPixel; i += bytesPerPixel) {
		r[i + 0] = 0;
		r[i + 1] = 0;
		r[i + 2] = 255;
		r[i + 3] = 255;
	}
	return 0;
}
