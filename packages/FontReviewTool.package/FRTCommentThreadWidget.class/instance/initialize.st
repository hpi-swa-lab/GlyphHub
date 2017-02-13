as yet unclassified
initialize
	super initialize.
	self
		hResizing: #rigid;
		vResizing: #rigid;
		color: BTWidget backgroundColor;
		beSticky;
		withPadding;
		size: 500 asPoint;
		yourself