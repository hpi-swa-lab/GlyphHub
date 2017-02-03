as yet unclassified
initialize
	super initialize.
	text := ''.
	layout := self primLayoutCreate.
	self primLayout: layout font: 'Open Sans 16'.

	self color: Color white