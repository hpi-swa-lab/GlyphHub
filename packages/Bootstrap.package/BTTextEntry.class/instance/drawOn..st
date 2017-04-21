drawing
drawOn: aCanvas

	self
		drawOn: aCanvas
		selectionColor: Color white
		selectionFillColor: BTColorScheme selectionColor
		drawCursor: (focused and: [drawCursor])