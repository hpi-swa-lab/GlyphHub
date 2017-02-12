as yet unclassified
drawOn: aCanvas
	self hasSelection ifTrue: [ | selection |
		selection := self selectionBoundRectangles.
		aCanvas
			fillRectangle: ((selection first origin corner: selection second corner) translateBy: self layoutBounds origin)
			 fillStyle: BTWidget selectionColor ].
	
	super drawOn: aCanvas.
	
	focused ifTrue: [
		aCanvas
			fillRectangle: (self layoutBounds origin + cursorRect origin extent: 1 @ cursorRect extent y)
			fillStyle: self color ]