as yet unclassified
initialize
	super initialize.
	
	self
		colorScheme: #inherit;
		checked: false;
		align: #(start start);
		do: [ self toggleChecked ];
		minSize: 22 asPoint