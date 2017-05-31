accessing
font: aFont

	font := aFont.
	
	
	sampleTextEditor displaySampleTextIfNotEmpty: aFont family standardSampleText.
	
	sampleTextEditor font: aFont.
	
	about text: font family about.
	biography text: font author biography