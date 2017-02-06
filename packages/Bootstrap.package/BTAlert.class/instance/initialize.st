as yet unclassified
initialize
	super initialize.
	
	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		listCentering: #center;
		layoutInset: 20 @ 12;
		colorType: #success