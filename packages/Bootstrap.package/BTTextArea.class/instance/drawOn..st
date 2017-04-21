drawing
drawOn: aCanvas

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: (self colorScheme focused: focused).
	
	super drawOn: aCanvas