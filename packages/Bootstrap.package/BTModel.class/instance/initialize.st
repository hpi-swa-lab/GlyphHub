as yet unclassified
initialize
	super initialize.
	
	dirtyFields := Array new: self numberOfFields.
	
	self
		privateId: 0;
		markAllDirty: true