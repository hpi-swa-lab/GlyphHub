as yet unclassified
initialize
	layout := BTTextLayout new font: 'Roboto 12'; yourself.
	text := ''.
	angle := 0.
	fillMode := #fixed.
	
	super initialize.
	
	self color: (Color fromString: '#111111').