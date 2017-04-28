callbacks
penColor: aColor

	drawingArea penColor: aColor.
	
	self flag: #todo. "investigate why colorschemes are behaving weirdly here"
	colorButton colorScheme: (BTColorScheme fg: aColor bg: Color transparent border: self colorScheme border)