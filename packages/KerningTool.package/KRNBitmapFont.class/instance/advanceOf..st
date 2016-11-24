as yet unclassified
advanceOf: aCharacter
	| glyph |
	glyph := glyphs at: aCharacter asUnicode ifAbsent: [ ^0 @ 0].
	^glyph first extent * glyph second scale