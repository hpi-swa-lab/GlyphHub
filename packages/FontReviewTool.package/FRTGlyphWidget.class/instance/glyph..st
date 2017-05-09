accessing
glyph: aGlyphModel

	aGlyphModel font ifNotNil: [self font: aGlyphModel font].

	self glyphNames: {aGlyphModel glyphName}