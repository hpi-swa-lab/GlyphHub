#include <pango/pangocairo.h>

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
		int end);

sqInt sqCreateLayout();
PangoLayout *sqLayoutForHandle(sqInt handle);

void sqRegisterCustomFontLen(char *font, int len);
void sqRegisterCustomFontDirectory(char *directory, int len);
void sqSetDpi(int dpi);

void sqPangoShutdown();
