as yet unclassified
font: aFont

	font := aFont.
	sampleTextEditor font: aFont.
	
	aFont family standardSampleText ifNotNilDo: [:sampleText | sampleTextEditor sampleText: sampleText].
	
	about text: font family about.
	biography text: font author biography