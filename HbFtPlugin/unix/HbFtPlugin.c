#include "sq.h"
#include "HbFtPlugin.h"
#include "Fonts.h"

sqInt sqFontsCompute(sqInt a) {
	return 42;
}

sqInt sqRenderStringLen(char *srcPtr, sqInt srcLen) {
	font_library_t *lib = font_library_new();
	if (!lib)
		return 0;

	char *str = malloc(sizeof(char) * (srcLen + 1));
	strncpy(str, srcPtr, srcLen);
	str[srcLen] = 0;

	surface_t *surface = surface_new(400, 600, 4);
	font_t *font = font_load(lib, "/usr/share/fonts/truetype/roboto/hinted/Roboto-Bold.ttf", 11, 96 * 2);

	surface_render_text(surface, font, str);
	surface_save_png(surface, "fonts.png");

	free(str);
	surface_free(surface);
	font_free(font);
	font_library_free(lib);

	return 1;
}

char *str_nullterm(char *str, int len) {
	char *ntstr = malloc(sizeof(char) * (len + 1));
	strncpy(ntstr, str, len);
	ntstr[len] = '\0';
	return ntstr;
}
void str_free(char *str) {
	free(str);
}

sqInt sqBitmapTestWidthHeightDepthPointerStrLenPtsizeDpiFontLen(sqInt bmBitsSize,
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

	int bytesPerPixel = bmDepth / 8;
	// BGRA format
	for (int i = 0; i < bmWidth * bmWidth * bytesPerPixel; i += bytesPerPixel) {
		buffer[i + 0] = 0;
		buffer[i + 1] = 0;
		buffer[i + 2] = 0;
		buffer[i + 3] = 255;
	}

	font_library_t *lib = font_library_new();
	if (!lib)
		return 0;

	char *str = str_nullterm(_str, len);
	char *fontName = str_nullterm(_fontName, fontNameLen);

	surface_t *surface = surface_new_for_data(bmWidth, bmHeight, bmDepth / 8, buffer);
	font_t *font = font_load(lib, fontName, ptSize, dpi);

	surface_render_text(surface, font, str);

	str_free(str);
	str_free(fontName);
	surface_free_externaldata(surface);
	font_free(font);
	font_library_free(lib);
	return 0;
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
