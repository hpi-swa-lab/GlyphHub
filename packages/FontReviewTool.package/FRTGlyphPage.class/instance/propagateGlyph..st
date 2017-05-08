updating
propagateGlyph: aGlyph

	self
		updateUnicodeLabel: aGlyph;
		glyph: aGlyph.
			
	glyphName text: 'Glyph ', self glyph glyphName.
	glyphWidget
		glyph: self glyph;
		pointSize: 128.