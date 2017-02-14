drawing
drawOn: aCanvas
	super drawOn: aCanvas.

	self hasSelection ifTrue: [ | selection |
		selection := self selectionBounds.
		self drawOn: aCanvas from: selection first to: selection second color: Color white fillColor: BTColorScheme selectionColor ].
	
	(focused and: [drawCursor and: [self hasSelection not]]) ifTrue: [
		aCanvas
			fillRectangle: (self layoutBounds origin + cursorRect origin extent: 1 @ cursorRect extent y)
			fillStyle: self colorScheme foreground ]