as yet unclassified
font: aFont

	font := aFont.
	sampleTextEditor font: aFont.
	
	sampleTextEditor displaySampleTextIfNotEmpty: aFont family standardSampleText.
	
	about text: font family about.
	biography text: font author biography