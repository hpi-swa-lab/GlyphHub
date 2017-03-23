initialize-release
initialize
	super initialize.
	
	self
		colorScheme: (BTColorScheme colorType: #secondary);
		padding: 12 @ 8