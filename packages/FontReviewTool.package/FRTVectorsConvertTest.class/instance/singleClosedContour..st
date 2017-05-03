as yet unclassified
singleClosedContour: aPointSizeNumber

	^ FRTOutline new
		forGlif: self glifSingleClosedCurve fontinfo: self simpleFontinfo;
		pointSize: aPointSizeNumber