updating
updateControlsFor: aParagraph

	pointSizeInput text: aParagraph pointSize asString.
	fontInput text: (aParagraph font ifNotNilDo: #fontName ifNil: [''])