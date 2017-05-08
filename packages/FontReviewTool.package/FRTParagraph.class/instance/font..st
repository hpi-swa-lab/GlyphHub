accessing
font: aFontNameString

	font := aFontNameString.
	
	font ifNotNil: [super font: font]