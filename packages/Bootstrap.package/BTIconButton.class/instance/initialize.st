as yet unclassified
initialize
	icon := BTIcon new.
	
	super initialize.
	
	self
		add: icon;
		colorScheme:  (BTColorScheme fg: (Color fromString: '#808080') bg: nil border: nil)