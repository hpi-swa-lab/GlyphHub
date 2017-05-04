drawing
drawOn: aCanvas

	self isReady ifTrue: [ | offset rectangle |
		offset := self innerBounds origin + (self centered
			ifTrue: [(self innerBounds extent / 2) - ((renderer extentOf: self glyphNames size: self pointSize) / 2)]
			ifFalse: [0 asPoint]).
		
		" see if we overshoot above our ascender "
		rectangle := renderer boundsOfGlyphs: self glyphNames atPointSize: self pointSize.
		
		renderer
			drawGlyphs: self glyphNames
			size: self pointSize
			on: aCanvas
			at: offset - (rectangle origin min: 0 @ (renderer descender * (renderer scaleFactorAt: self pointSize) negated))
			color: self colorScheme foreground]