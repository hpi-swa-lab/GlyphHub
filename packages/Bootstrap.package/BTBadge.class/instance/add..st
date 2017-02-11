as yet unclassified
add: aWidget
	super add: aWidget.
	
	aWidget color: ((BTWidget colorsForType: colorType) at: #foreground)