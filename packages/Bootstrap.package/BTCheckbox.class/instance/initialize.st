as yet unclassified
initialize
	super initialize.
	
	self
		colorScheme: #inherit;  
		checked: false;
		do: [ self checked: self checked not ];
		size: 22 asPoint;
		vResizing: #rigid;
		hResizing: #rigid;
		alignItems: #(center center)