as yet unclassified
ptSize: aNumber
	super ptSize: aNumber.
	glyphDataObject scale: self toPtSize: aNumber.
	self updateExtent