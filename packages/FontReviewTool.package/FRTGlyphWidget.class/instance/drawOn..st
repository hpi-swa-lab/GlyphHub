drawing
drawOn: aCanvas

	self isReady ifTrue: [ | offset |
		offset := self innerBounds origin + (self centered
			ifTrue: [(self innerBounds extent / 2) - ((renderer extentOf: self glyphNames size: self pointSize) / 2)]
			ifFalse: [0 asPoint]).
		
		renderer
			drawGlyphs: self glyphNames
			size: self pointSize
			on: aCanvas
			at: offset
			color: self colorScheme foreground]