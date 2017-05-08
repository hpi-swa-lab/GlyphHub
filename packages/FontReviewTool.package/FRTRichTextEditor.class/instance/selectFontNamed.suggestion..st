todo
selectFontNamed: aString suggestion: aSuggestion

	aSuggestion data downloadOTF then: [
		richText selectedFont: aSuggestion data fontNameForPango]