as yet unclassified
testConvertPositions

	| outline p |
	outline := FRTOutline new forGlif: self glifSingleClosedCurve fontinfo: self simpleFontinfo.
	
	p := 0 @ 0.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p.
	
	p := 100 @ 0.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p.

	p := 0 @ 100.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p.

	p := 100 @ 100.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p.

	p := 70 @ 30.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p.

	p := 100 @ -30.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p.

	p := -30 @ -30.
	(self expect: (outline transformPosition: (outline transformPoint: p))) to equal: p