as yet unclassified
initialize
	super initialize.
	
	label := BTLabel new text: 'This is an alert!'.
	
	self
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		listCentering: #center;
		layoutInset: 20 @ 12;
		colorType: #info;
		addMorph: label