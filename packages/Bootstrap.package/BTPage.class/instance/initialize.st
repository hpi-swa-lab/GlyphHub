as yet unclassified
initialize
	super initialize.
	
	self
		color: Color white;
		layoutInset: BTWidget spacing;
		cellInset: BTWidget spacing;
		changeTableLayout;
		listDirection: #topToBottom;
		extent: 500 asPoint