as yet unclassified
initialize
	layout := self class textLayoutClass new font: 'Roboto 12'; yourself.
	text := ''.
	angle := 0.
	styleAttributes := Dictionary new.
	layoutWidth := -1.
	wrap := true.
	
	super initialize