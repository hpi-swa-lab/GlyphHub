as yet unclassified
drawControlPointHandleOn: aCanvas

	BTWidget
		drawCircularBackgroundOn: aCanvas
		bounds: self bounds
		colors: (BTColorScheme
			withForeground: self color
			background: nil
			border: self color)