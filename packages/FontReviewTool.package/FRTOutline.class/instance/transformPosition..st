as yet unclassified
transformPosition: aPoint

	| point scale |
	point := aPoint - self position.
	scale := self unitsPerEm / self pointSize.
	^ (point x @ ((self ascender / self unitsPerEm * self pointSize) - point y)) * scale