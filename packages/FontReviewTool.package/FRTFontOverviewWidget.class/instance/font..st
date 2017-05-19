as yet unclassified
font: aFont

	font := aFont.
	sampleTextEditor font: aFont.
	
	aFont family standardSampleText ifNotNilDo: [:sampleText | sampleTextEditor sampleText: sampleText]