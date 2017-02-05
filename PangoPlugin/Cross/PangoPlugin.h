#include <pango/pangocairo.h>

void sqLayoutRenderWidthHeightDepthPointerXYColor(
		PangoLayout *layout,
		sqInt bmWidth,
		sqInt bmHeight,
		sqInt bmDepth,
		unsigned char *buffer,
		double x,
		double y,
		sqInt color);

PangoLayout *sqCreateLayout();

void sqRegisterCustomFontLen(char *font, int len);
void sqRegisterCustomFontDirectory(char *directory, int len);

void sqPangoShutdown();
