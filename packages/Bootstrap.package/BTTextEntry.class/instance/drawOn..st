as yet unclassified
drawOn: aCanvas
	"self hasSelection
		ifTrue: [ | selection |
			selection := self selectionBoundRectangles.
			aCanvas
				fillRectangle: ((selection first origin corner: selection second corner) translateBy: self layoutBounds origin)
				 fillStyle: BTWidget selectionColor ]."

	super drawOn: aCanvas.

	self hasSelection ifTrue: [ | selection |
		selection := self selectionBounds.
		self drawOn: aCanvas from: selection first to: selection second color: Color white fillColor: BTWidget selectionColor ].
	
	focused ifTrue: [
		aCanvas
			fillRectangle: (self layoutBounds origin + cursorRect origin extent: 1 @ cursorRect extent y)
			fillStyle: self color ]