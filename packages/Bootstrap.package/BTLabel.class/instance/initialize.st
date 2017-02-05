as yet unclassified
initialize
	layout := BTTextLayout new font: 'Roboto 16'; yourself.
	text := ''.
	fillMode := #fixed.

	super initialize.
	
	self color: (Color fromString: '#111111').