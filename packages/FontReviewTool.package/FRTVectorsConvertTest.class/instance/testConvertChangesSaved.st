as yet unclassified
testConvertChangesSaved

	| outline source |
	source := self glifSingleClosedCurve.
	
	outline := FRTOutline new forGlif: source fontinfo: self simpleFontinfo.
	outline contours first elements first controlPoint2: 70 @ 0.

	((source firstTagNamed: #contour) elements third)
		attributeAt: #x put: 70 asString;
		attributeAt: #y put: 0 asString.
	
	(self expect: (self xmlToString: outline xmlElement)) to equal: (self xmlToString: source)