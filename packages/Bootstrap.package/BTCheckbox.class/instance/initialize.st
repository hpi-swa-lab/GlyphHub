as yet unclassified
initialize
	super initialize.
	
	self
		colorScheme: #inherit;
		checked: false;
		align: #(start start);
		do: [ self checked: self checked not ];
		minSize: 22 asPoint