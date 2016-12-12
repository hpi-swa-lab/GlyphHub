initialize-release
initialize 
	super initialize.
	
	handleType := #auto.
	
	self
		extent: 12 asPoint;
		borderColor: nil;
		borderWidth: 0;
		selected: false