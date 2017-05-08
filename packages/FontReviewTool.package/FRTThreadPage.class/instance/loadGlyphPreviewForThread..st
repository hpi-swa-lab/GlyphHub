loading
loadGlyphPreviewForThread: aThread

	preview
		font: aThread font;
		glyphNames: (aThread glyphs collect: [:glyph  | glyph glyphName]).
	preview whenReady then: [self layoutChanged]