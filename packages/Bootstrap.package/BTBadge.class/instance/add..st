as yet unclassified
add: aWidget
	super add: aWidget.
	
	aWidget color: (BTColorScheme type: colorType mode: #invert) foreground