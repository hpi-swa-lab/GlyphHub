#include <fontconfig/fontconfig.h>
#include <Fonts.h>

sqInt sqFontLibraryInit();
sqInt sqFontLibraryShutdown();
font_library_t *sqFontLibraryGet();
sqInt sqRenderStringLen(char *srcPtr, sqInt srcLen);
sqInt sqBitmapTestWidthHeightDepthPointerReal(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, sqInt bmBits, unsigned char *r);
sqInt sqGetFontMetrics(char *_fontName, int fontNameLen, int ptSize, int dpi, int *ascender, int *descender, int *height, int *max_advance);
sqInt sqFontMeasureWidth(char *_fontName, int fontNameLen, int ptSize, int dpi, char *stringPtr, int stringLen);
sqInt sqBitmapTestWidthHeightDepthPointerStrLenPtsizeDpiFontLen(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, unsigned char *buffer, char *str, int len, int ptSize, int dpi, char *font, int fontLen);
