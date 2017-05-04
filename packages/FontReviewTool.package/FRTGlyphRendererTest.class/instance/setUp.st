as yet unclassified
setUp

	super setUp.
	
	renderer := FRTGlyphRenderer new
		fontinfo: self simpleFontinfo.
	
	renderer loadedGlifs
		at: 'B' put: self glifSingleClosedCurve;
		at: 'C' put: self glifSmallClosedCurve