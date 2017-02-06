#include <pango/pangocairo.h>

void sqLayoutRenderWidthHeightDepthPointerTransformColor(
		PangoLayout *layout,
		sqInt bmWidth,
		sqInt bmHeight,
		sqInt bmDepth,
		unsigned char *buffer,
		float *matrix,
		sqInt color);

PangoLayout *sqCreateLayout();

void sqRegisterCustomFontLen(char *font, int len);
void sqRegisterCustomFontDirectory(char *directory, int len);

void sqPangoShutdown();
