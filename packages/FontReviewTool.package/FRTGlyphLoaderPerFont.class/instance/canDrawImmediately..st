as yet unclassified
canDrawImmediately: aGlyphNameStringCollection

	fontinfo ifNil: [^ false].
	aGlyphNameStringCollection ifEmpty: [^ true].

	^ (aGlyphNameStringCollection
		gather: [:glyphName | self allKnownRequiredGlyphNamesFor: glyphName])
		allSatisfy: [:glyphName |
			glifs at: glyphName ifPresent: #isResolved ifAbsent: [false]]