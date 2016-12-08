as yet unclassified
layoutChanged 
	super layoutChanged.
	
	lockLayoutChanged ifFalse: [
		self updateExtent ]