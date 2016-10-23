measuring
widthOfString: aString from: startIndex to: stopIndex
	"Measure the length of the given string between start and stop index"
	aString ifEmpty: [ ^0 ].
	^HbFt
	primFontMeasureWidthFor: (aString copyFrom: startIndex to: stopIndex)
	font: self familyName
	ptSize: self pointSize
	dpi: 96 * 2