as yet unclassified
initialize
	super initialize.
	
	label := BTLabel new text: 'Primary'.
	hovered := true.	

	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 12 @ 6;
		listCentering: #center;
		addMorph: label;
		colorType: #primary