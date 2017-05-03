as yet unclassified
layoutChanged

	super layoutChanged.
	
	self owner ifNotNil: [self owner layoutChanged]