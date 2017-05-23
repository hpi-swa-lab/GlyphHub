as yet unclassified
testPageShowsSampleText

	| text |
	(self expect: page) to haveText: sampleText title.
	
	text := (Json readFrom: sampleText text readStream) first at: 'text'.
	(self expect: page) to haveText: text