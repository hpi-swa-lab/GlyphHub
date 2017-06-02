callbacks
loadGlyphPreviewForThread: aThread

	glyphsPreview
		font: aThread font;
		glyphNames: (aThread sortedGlyphs collect: [:glyph | glyph glyphName]).
	glyphsPreview whenReady then: [self layoutChanged]