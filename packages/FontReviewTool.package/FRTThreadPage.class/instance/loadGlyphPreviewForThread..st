loading
loadGlyphPreviewForThread: aThread

	preview
		font: aThread font;
		glyphNames: (aThread sortedGlyphs collect: #glyphName).
	preview whenReady then: [self layoutChanged]