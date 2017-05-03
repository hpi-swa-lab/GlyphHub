drawing
drawOn: aCanvas

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: self colorScheme.
	
	super drawOn: aCanvas