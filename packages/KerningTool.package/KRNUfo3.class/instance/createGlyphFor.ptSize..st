as yet unclassified
createGlyphFor: aCharacter ptSize: aNumber
	| unicode glyph |
	unicode := aCharacter asUnicode.
	glyph := codePointsTable at: unicode ifAbsentPut: [
		glyphs detect: [ :g | g displaysUnicode: unicode ] ifNone: [nil]].

	" FIXME best return empty/.undef character morph from glyph map if exists "
	glyph ifNil: [ ^nil ].
	^glyph copy ptSize: aNumber; yourself