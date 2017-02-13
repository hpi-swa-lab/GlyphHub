as yet unclassified
initialize
	super initialize.
	
	self
		hovered: false;
		active: false;
		do: [];
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		listCentering: #center