as yet unclassified
initialize
	super initialize.

	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		vertical: false;
		justifyItems: #left;  
		spacing: BTWidget spacing;
		padding: 20 @ 12