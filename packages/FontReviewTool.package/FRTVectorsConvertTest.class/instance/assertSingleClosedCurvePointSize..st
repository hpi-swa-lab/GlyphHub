as yet unclassified
assertSingleClosedCurvePointSize: aNumber

	| outline curves scale |
	scale := aNumber / self unitsPerEm.
	outline := self singleClosedContour: aNumber.
	
	(self expect: outline contours first closed) to be: true.
	
	curves := outline contours first elements.
	(self expect: (curves first positionOf: #startPoint)) to equal: (0 @ self ascender * scale) rounded.
	(self expect: (curves first positionOf: #endPoint)) to equal: (100 @ 0 * scale) rounded.
	(self expect: (curves first positionOf: #endPoint)) to equal: (curves second positionOf: #startPoint).
	(self expect: (curves first positionOf: #startPoint)) to equal: (curves second positionOf: #endPoint)