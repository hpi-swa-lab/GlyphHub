as yet unclassified
testMaxToAscenderScaled

	| size |
	size := renderer extentOf: {'smallClosedCurve'} size: 500.
	
	(self expect: size) to equal: 100 @ ((self simpleFontinfo at: 'ascender') - (self simpleFontinfo at: 'descender')) / 2