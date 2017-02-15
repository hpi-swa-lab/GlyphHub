as yet unclassified
layout: aWidget in: aRectangle
	| data |
	data := self sizeOf: aWidget in: aRectangle.
	aWidget layoutBounds: data first.
	self placeChildrenOf: aWidget in: data first additionalSpace: data second hasExpanders: data third > 0 spacing: aWidget spacing minSizes: data fourth