drawing
drawOn: aCanvas
	(hovered or: [active]) ifTrue: [
		aCanvas
			fillRectangle: self bounds
			fillStyle: self colorScheme background ]