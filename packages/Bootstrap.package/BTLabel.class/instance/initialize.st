as yet unclassified
initialize
	super initialize.
	text := ''.
	layout := self primLayoutCreate.
	self primLayout: layout font: 'Roboto 12'.

	self color: Color white