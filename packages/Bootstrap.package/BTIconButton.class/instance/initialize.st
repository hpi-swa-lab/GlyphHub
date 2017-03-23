initialize-release
initialize
	icon := BTIcon new align: #(center center).
	
	super initialize.
	
	self
		layoutPolicy: nil;
		add: icon;
		colorScheme: (BTColorScheme fg: (Color fromString: '#808080') bg: nil border: nil)