as yet unclassified
mockThread

	| font glyph thread |
	thread := FRTThread new title: 'Hello world!'.
	font := FRTFont new fontName: 'Riblon'.
	glyph := FRTGlyph new font: font; glyphName: 'A'; versionHash: 'abc736afeaa2321123afceda'.
	thread threadGlyphAssociations add: (FRTThreadGlyphAssociation new glyph: glyph).
	
	^ thread