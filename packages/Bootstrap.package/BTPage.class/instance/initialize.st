as yet unclassified
initialize
	super initialize.
	
	self
		color: Color transparent;
		spacing: BTWidget spacing;
		listCentering: #topLeft;
		wrapCentering: #topLeft;
		cellPositioning: #topLeft;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		changeTableLayout;
		listDirection: #topToBottom