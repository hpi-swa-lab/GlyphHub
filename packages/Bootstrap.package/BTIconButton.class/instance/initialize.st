initialize-release
initialize

	icon := BTIcon new align: #(center center).
	
	super initialize.
	
	self
		layoutPolicy: nil;
		add: icon;
		colorScheme: (BTColorScheme withForeground: (Color fromString: '#808080'))