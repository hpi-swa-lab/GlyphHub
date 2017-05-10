mock-data
mockGlyph

	| font glyph |
	font := FRTFont new fontName: 'Riblon'.
	glyph := FRTGlyph new font: font; glyphName: 'A'; versionHash: 'abc736afeaa2321123afceda'.
	
	^ glyph