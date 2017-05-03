as yet unclassified
testConvertAndBack

	| outline source |
	source := self glifSingleClosedCurve.
	
	outline := FRTOutline new forGlif: source fontinfo: self simpleFontinfo.
	
	(self expect: (self xmlToString: outline xmlElement)) to equal: (self xmlToString: source)