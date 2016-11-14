as yet unclassified
createGlyphForUnicode: unicode ptSize: aNumber
	| glyph |
	glyph := glyphs at: unicode ifAbsent: [ ^KRNTextElement new font: self; ptSize: 20; yourself ].
	^(KRNBitmapGlyph newForForm: glyph from: self) ptSize: aNumber; yourself