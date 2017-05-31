accessing
font: aFont

	font := aFont.

	sampleTextEditor
		displaySampleTextIfNotEmpty: aFont family standardSampleText;
		font: aFont.
	
	about text: font family about.
	biography text: font author biography
