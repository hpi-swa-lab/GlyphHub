as yet unclassified
forWidget: aGlyphWidget

	self flag: #todo. "how to resolve multiple?"
	glyphWidget := aGlyphWidget.
	self
		glif: (aGlyphWidget renderer loadedGlifs at: aGlyphWidget glyphNames first);
		fontinfo: aGlyphWidget renderer fontinfo;
		pointSize: aGlyphWidget pointSize