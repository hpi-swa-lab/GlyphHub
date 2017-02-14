as yet unclassified
initialize
	super initialize.

	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		colorType: #secondary;
		padding: 6 @ 4