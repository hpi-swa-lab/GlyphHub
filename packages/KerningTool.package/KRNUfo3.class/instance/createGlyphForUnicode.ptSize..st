as yet unclassified
createGlyphForUnicode: unicode ptSize: aNumber
	| glyph |
	glyph := codePointsTable at: unicode ifAbsentPut: [
		glyphs detect: [ :g | g displaysUnicode: unicode ] ifNone: [nil]].
	
	" FIXME best return empty/.undef character morph from glyph map if exists "
	glyph ifNil: [ ^nil ].
	^(KRNGlyph newForXML: glyph from: self) ptSize: aNumber; yourself