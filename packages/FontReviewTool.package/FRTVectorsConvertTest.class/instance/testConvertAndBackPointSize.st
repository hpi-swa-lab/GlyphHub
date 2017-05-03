as yet unclassified
testConvertAndBackPointSize

	| outline source |
	source := self glifSingleClosedCurve.
	
	outline := self singleClosedContour: 12.
	
	(self expect: (self xmlToString: outline xmlElement)) to equal: (self xmlToString: source)