as yet unclassified
canDrawImmediately: aGlyphNameStringCollection

	fontinfo ifNil: [^ false].

	^ (aGlyphNameStringCollection
		gather: [:glyphName | self allKnownRequiredGlyphNamesFor: glyphName])
		allSatisfy: [:glyphName |
			glifs at: glyphName ifPresent: #isResolved ifAbsent: [false]]