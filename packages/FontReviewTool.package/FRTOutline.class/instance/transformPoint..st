as yet unclassified
transformPoint: aPoint

	^ (aPoint x @ (self ascender - aPoint y)) / self unitsPerEm * self pointSize