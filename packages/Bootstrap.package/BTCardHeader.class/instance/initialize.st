as yet unclassified
initialize
	super initialize.

	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		vertical: false;
		alignItems: #(start center);
		spacing: BTWidget spacing;
		padding: 20 @ 12