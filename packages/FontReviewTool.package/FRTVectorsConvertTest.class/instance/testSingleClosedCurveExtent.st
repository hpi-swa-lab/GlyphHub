as yet unclassified
testSingleClosedCurveExtent

	| outline |
	outline := self singleClosedContour: self unitsPerEm.
	(self expect: outline extent) to equal: 100 @ self height.

	outline := self singleClosedContour: 12.
	(self expect: outline extent) to equal: (100 @ self height * (12 / self unitsPerEm)) rounded.

	outline := self singleClosedContour: 12000.
	(self expect: outline extent) to equal: (100 @ self height * (12000 / self unitsPerEm)) rounded