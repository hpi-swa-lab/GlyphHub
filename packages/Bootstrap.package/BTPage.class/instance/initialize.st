as yet unclassified
initialize
	super initialize.
	
	self
		color: Color transparent;
		layoutInset: BTWidget spacing;
		cellInset: BTWidget spacing;
		listCentering: #topLeft;
		wrapCentering: #topLeft;
		cellPositioning: #topLeft;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		changeTableLayout;
		listDirection: #topToBottom