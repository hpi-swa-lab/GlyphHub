as yet unclassified
testConvertPositionsAtPointSize

	| outline p |
	outline := FRTOutline new
		forGlif: self glifSingleClosedCurve fontinfo: self simpleFontinfo;
		pointSize: 12.
	
	p := 0 @ 0.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p.
	
	p := 100 @ 0.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p.

	p := 0 @ 100.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p.

	p := 100 @ 100.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p.

	p := 70 @ 30.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p.

	p := 100 @ -30.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p.

	p := -30 @ -30.
	(self expect: (outline positionToFontUnits: (outline fontUnitsToPosition: p)) rounded) to equal: p