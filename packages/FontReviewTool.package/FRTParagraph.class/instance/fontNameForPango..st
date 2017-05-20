accessing
fontNameForPango: aString

	fontNameForPango := aString.
	aString ifNotNil: [super font: aString]