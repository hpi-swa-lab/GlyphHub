drawing
drawOn: aCanvas

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self layoutBounds
		colors: (BTColorScheme withBackground: (Color gray alpha: 0.8))