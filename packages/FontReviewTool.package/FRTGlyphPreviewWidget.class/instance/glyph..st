initialize-release
glyph: aGlyphModel

	self removeAllMorphs.
	glyph := aGlyphModel.
	label := (BTLabel text: glyph glyphName)
		ellipsize: #middle;
		alignment: #center.
	glyphWidget glyph: glyph.
	
	self
		add: glyphWidget;
		add: label;
		add: counter.
	
	self commentCount: glyph threadGlyphAssociations size