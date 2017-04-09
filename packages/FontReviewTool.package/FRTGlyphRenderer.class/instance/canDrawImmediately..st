drawing
canDrawImmediately: aGlyphNameStringOrCollection
	" return whether we still can immediately draw the given string with our currently cached data "

	| list |
	list := aGlyphNameStringOrCollection isCollection
		ifTrue: [aGlyphNameStringOrCollection]
		ifFalse: [{aGlyphNameStringOrCollection}].
	^ fontinfo notNil and: [list allSatisfy: [:glyphName | self canDrawGlyphImmediately: glyphName]]