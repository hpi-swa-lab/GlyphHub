as yet unclassified
drawOn: aCanvas
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: (BTColorScheme type: colorType mode: #invert)