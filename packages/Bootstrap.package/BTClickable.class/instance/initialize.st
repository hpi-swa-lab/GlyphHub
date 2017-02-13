as yet unclassified
initialize
	super initialize.
	
	hovered := false.
	active := false.
	do := [].
	
	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		listCentering: #center