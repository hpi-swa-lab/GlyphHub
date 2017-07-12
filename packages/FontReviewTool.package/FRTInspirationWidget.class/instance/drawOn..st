as yet unclassified
drawOn: aCanvas

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: (self colorScheme background: nil)