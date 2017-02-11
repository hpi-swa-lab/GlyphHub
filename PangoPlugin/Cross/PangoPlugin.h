#include <pango/pangocairo.h>

void sqLayoutRenderWidthHeightDepthPointerTransformColorClipXClipYClipWidthClipHeight(
		PangoLayout *layout,
		sqInt bmWidth,
		sqInt bmHeight,
		sqInt bmDepth,
		unsigned char *buffer,
		float *matrix,
		unsigned int color,
		float clipX,
		float clipY,
		float clipWidth,
		float clipHeight);

PangoLayout *sqCreateLayout();

void sqRegisterCustomFontLen(char *font, int len);
void sqRegisterCustomFontDirectory(char *directory, int len);
void sqSetDpi(int dpi);

void sqPangoShutdown();
