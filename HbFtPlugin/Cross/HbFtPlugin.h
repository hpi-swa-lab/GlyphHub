#include <fontconfig/fontconfig.h>
#include <Fonts.h>

sqInt sqFontLibraryInit();
sqInt sqFontLibraryShutdown();
font_library_t *sqFontLibraryGet();
sqInt sqRenderStringLen(char *srcPtr, sqInt srcLen);
sqInt sqBitmapTestWidthHeightDepthPointerReal(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, sqInt bmBits, unsigned char *r);
sqInt sqBitmapTestWidthHeightDepthPointerStrLenPtsizeDpiFontLen(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, unsigned char *buffer, char *str, int len, int ptSize, int dpi, char *font, int fontLen);
