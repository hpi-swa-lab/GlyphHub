#ifndef __ABC_FONTS_H__
#define __ABC_FONTS_H__

int sqFontsCompute(int);
sqInt sqRenderStringLen(char *srcPtr, sqInt srcLen);
sqInt sqBitmapTestWidthHeightDepthPointerReal(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, sqInt bmBits, unsigned char *r);
sqInt sqBitmapTestWidthHeightDepthPointerStrLenPtsizeDpiFontLen(sqInt bmBitsSize, sqInt bmWidth, sqInt bmHeight, sqInt bmDepth, unsigned char *buffer, char *str, int len, int ptSize, int dpi, char *font, int fontLen);

#endif // __ABC_FONTS_H__
