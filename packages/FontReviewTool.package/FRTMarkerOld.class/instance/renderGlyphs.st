as yet unclassified
renderGlyphs
	self unicodePoints do: [ :glyph | 
		(self fontProject createGlyphForUnicode: (glyph codePoint) ptSize: 200) openInWorld ]