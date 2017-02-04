as yet unclassified
initialize
	super initialize.
	text := ''.
	layout := self primLayoutCreate.
	self primLayout: layout font: 'Roboto 20'.

	self color: (Color fromString: '#111111').