as yet unclassified
testSingleClosedCurveElements

	| outline |
	outline := self singleClosedContour: self unitsPerEm.
	
	(self expect: outline contours size) to equal: 1.
	(self expect: outline contours first elements size) to equal: 2