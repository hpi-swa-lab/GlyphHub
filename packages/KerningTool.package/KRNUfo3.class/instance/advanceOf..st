as yet unclassified
advanceOf: aCharacter
	| glif |
	glif := codePointsTable at: aCharacter asUnicode ifAbsent: [ ^0 @ 0 ].
	" FIXME proper impl can be seen in KRNGlyph>>advance "
	^((glif firstTagNamed: #advance) attributeAt: #width) asNumber asPoint