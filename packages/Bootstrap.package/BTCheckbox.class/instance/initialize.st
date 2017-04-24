initialize-release
initialize
	super initialize.
	
	self
		colorScheme: #inherit;
		checked: false;
		align: #(start start);
		when: #clickedWithEvent send: #toggleChecked to: self;
		minSize: 22 asPoint