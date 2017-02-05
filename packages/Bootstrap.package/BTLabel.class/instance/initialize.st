as yet unclassified
initialize
	layout := self primLayoutCreate.
	text := ''.
	fillMode := #fixed.

	super initialize.
	self primLayout: layout font: 'Roboto 20'.

	self color: (Color fromString: '#111111').