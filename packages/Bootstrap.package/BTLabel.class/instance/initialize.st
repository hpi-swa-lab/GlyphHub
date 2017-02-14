as yet unclassified
initialize
	layout := BTTextLayout new font: 'Roboto 12'; yourself.
	text := ''.
	angle := 0.
	fillMode := #fixed.
	styleAttributes := Dictionary new.
	
	super initialize