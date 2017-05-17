callbacks
loadGlyphPreviewForThread: aThread

	glyphsPreview
		font: aThread font;
		glyphNames: (aThread glyphs collect: [:glyph  | glyph glyphName]).
	glyphsPreview whenReady then: [self layoutChanged]