updating
selectFontNamed: aString suggestion: aSuggestion

	aSuggestion data downloadOtf then: [
		richText selectedFont: aSuggestion data]