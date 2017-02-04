as yet unclassified
drawOn: aCanvas
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: (BTWidget colorsForType: colorType)