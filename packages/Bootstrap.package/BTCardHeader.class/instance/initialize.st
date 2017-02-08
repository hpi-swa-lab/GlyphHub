as yet unclassified
initialize
	super initialize.

	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		padding: 20 @ 12