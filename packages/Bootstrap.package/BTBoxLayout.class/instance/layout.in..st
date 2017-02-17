as yet unclassified
layout: aWidget in: aBox
	| data |
	data := self sizeOf: aWidget in: aBox.
	
	aWidget layoutBounds: data first.
	
	self
		placeChildrenOf: aWidget
		in: data first
		additionalSpace: data second
		hasExpanders: data third > 0
		spacing: aWidget spacing
		minSizes: data fourth