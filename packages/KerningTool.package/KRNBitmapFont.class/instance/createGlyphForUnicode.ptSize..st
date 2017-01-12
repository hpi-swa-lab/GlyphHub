as yet unclassified
createGlyphForUnicode: unicode ptSize: aNumber
	| glyph val |
	val := unicode.
	glyphs at: val ifAbsent: [ val := (Unicode charFromUnicode: val) asUppercase asUnicode ].
	glyph := glyphs at: val ifAbsent: [ ^KRNTextElement new font: self; ptSize: aNumber; yourself ].
	^(KRNBitmapData newForForm: glyph first from: self unicode: val)
		transform: glyph second;
		ptSize: aNumber;
		yourself