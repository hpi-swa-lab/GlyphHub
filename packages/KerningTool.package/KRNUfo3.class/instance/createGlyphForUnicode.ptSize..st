as yet unclassified
createGlyphForUnicode: unicode ptSize: aNumber
	| glyph |
	glyph := codePointsTable at: unicode ifAbsent: [ ^KRNTextElement new font: self; ptSize: 20; yourself ].
	
	" FIXME best return empty/.undef character morph from glyph map if exists "
	^(KRNGlyph newForXML: glyph from: self) ptSize: aNumber; yourself