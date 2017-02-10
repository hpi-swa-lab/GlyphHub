as yet unclassified
drawOn: aCanvas
	super drawOn: aCanvas.
	
	focused ifTrue: [
		aCanvas
			fillRectangle: (self layoutBounds origin + cursorRect origin extent: 1 @ cursorRect extent y )
			fillStyle: (Color fromString: '#333333') ]