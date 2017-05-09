initialize-release
glyph: aGlyphWidget

	glyph := aGlyphWidget.
	label := (BTLabel text: glyph glyphNames first)
		ellipsize: #middle;
		alignment: #center.
	
	self
		add: glyph;
		add: label;
		add: counter.
	
	self commentCount: 3