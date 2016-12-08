segments
layoutChanged 
	super layoutChanged.
	
	lockLayoutChanged ifFalse: [
		self updateExtent ]