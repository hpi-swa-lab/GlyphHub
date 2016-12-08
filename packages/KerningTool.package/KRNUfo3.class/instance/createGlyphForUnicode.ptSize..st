as yet unclassified
createGlyphForUnicode: unicode ptSize: aNumber
	| glyph |
	glyph := codePointsTable at: unicode ifAbsent: [
			" FIXME best return empty/.undef character morph from glyph map if exists "
			^KRNTextElement new font: self; ptSize: 20; yourself ].
	
	^(KRNVectorGlyph newForXML: glyph from: self) ptSize: aNumber; yourself