loading
loadGlyphPreviewForThread: aThread

	preview
		font: aThread font;
		glyphNames: (aThread glyphs collect: #glyphName).
	preview whenReady then: [self layoutChanged]