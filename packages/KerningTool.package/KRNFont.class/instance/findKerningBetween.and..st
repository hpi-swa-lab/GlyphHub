as yet unclassified
findKerningBetween: firstGlyph and: secondGlyph
	(firstGlyph isCursor or: [secondGlyph isCursor]) ifTrue: [ ^0 ].

	^self findKerningBetweenName: firstGlyph name and: secondGlyph name