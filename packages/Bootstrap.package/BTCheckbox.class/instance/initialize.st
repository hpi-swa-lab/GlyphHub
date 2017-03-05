as yet unclassified
initialize
	super initialize.
	
	self
		colorScheme: #inherit;
		checked: false;
		align: #(start start);
		when: #clicked send: #toggleChecked to: self;
		minSize: 22 asPoint