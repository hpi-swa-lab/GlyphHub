as yet unclassified
testDoesntShowFontSampleTexts

	| text |
	(self expect: page) to not haveText: otherSampleText title.
	
	text := (Json readFrom: otherSampleText text readStream) first at: 'text'.
	(self expect: page) to not haveText: text