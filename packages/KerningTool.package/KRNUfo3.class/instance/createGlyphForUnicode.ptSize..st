as yet unclassified
createGlyphForUnicode: unicode ptSize: aNumber
	| glyphData |
	glyphData := self glyphFlyweights at: unicode ifAbsent: [
			" FIXME best return empty/.undef character morph from glyph map if exists "
			^KRNTextElement new font: self; ptSize: 20; yourself ].
	
	^(KRNGlyphFlyweight newFrom: glyphData from: self) ptSize: aNumber; yourself