accessing
font: aFont

	font := aFont.
	
	font ifNotNil: [
		super font: font fontNameForPango]