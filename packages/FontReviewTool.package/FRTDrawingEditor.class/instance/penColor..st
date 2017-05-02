callbacks
penColor: aColor

	drawingArea penColor: aColor.
	
	self flag: #todo. "investigate why colorschemes are behaving weirdly here"
	colorButton colorScheme: (BTColorScheme withForeground: aColor background: Color transparent border: self colorScheme border)