drawing
drawOn: aCanvas
	self isReady ifTrue: [
		renderer
			drawGlyphs: self glyphNames
			size: self pointSize
			on: aCanvas
			at: self innerBounds origin
			color: self colorScheme foreground]