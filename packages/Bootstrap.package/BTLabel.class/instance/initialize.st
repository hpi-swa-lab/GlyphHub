as yet unclassified
initialize
	layout := BTTextLayout new font: 'Roboto 12'; yourself.
	text := ''.
	angle := 0.
	styleAttributes := Dictionary new.
	
	self fillMode: #fixed.
	
	super initialize