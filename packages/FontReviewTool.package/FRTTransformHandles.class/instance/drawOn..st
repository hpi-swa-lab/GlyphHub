drawing
drawOn: aCanvas

	self active ifTrue: [
		aCanvas frameRectangle: self bounds width: 3 color: (Color gray alpha: 0.4)]