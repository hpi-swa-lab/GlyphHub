drawing
drawOn: aCanvas

	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self layoutBounds
		colors: (BTColorScheme fg: nil bg: (Color gray alpha: 0.8) border: nil)