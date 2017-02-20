as yet unclassified
layout: aWidget in: aBox
	| data |
	Transcript show: 'START LAYOUT '; show: aWidget class name; cr.
	data := self sizeOf: aWidget in: aBox extent.
	
	aWidget layoutBounds: (aBox origin extent: data first).
	
	self
		placeChildrenOf: aWidget
		in: (aBox origin extent: data first)
		expanderSpace: data second
		minSizes: data third