as yet unclassified
font: aFont

	sampleTextEditor displaySampleTextIfNotEmpty: aFont family standardSampleText.
	
	font := aFont.
	sampleTextEditor font: aFont.
	
	about text: font family about.
	biography text: font author biography