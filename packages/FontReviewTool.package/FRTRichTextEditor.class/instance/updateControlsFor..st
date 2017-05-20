updating
updateControlsFor: aParagraph

	pointSizeInput text: aParagraph pointSize asString.
	fontInput text: (aParagraph fontNameForPango ifNil: [''])