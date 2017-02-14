as yet unclassified
initialize
	super initialize.
	
	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		vertical: false;  
		alignItems: #(start center);
		padding: 20 @ 12;
		colorType: #warning