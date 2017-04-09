drawing
drawGlyph: aGlyphNameString size: aPointSizeNumber on: aCanvas at: aPoint color: aColor
	
	| scaleFactor shapeAndAdvanceTuple |
	scaleFactor := self scaleFactorAt: aPointSizeNumber.
	shapeAndAdvanceTuple := self shapeOf: aGlyphNameString.

	shapeAndAdvanceTuple ifNotNil: [ | advance shape |
		shape := shapeAndAdvanceTuple first.
		advance := shapeAndAdvanceTuple second.
		
		self
			drawGlyphShape: shape
			scaleFactor: scaleFactor
			on: aCanvas
			at: aPoint
			color: aColor.

		(glifs at: aGlyphNameString) tagsNamed: #component do: [:component | | offset |
			offset := (component attributeAt: #xOffset ifAbsent: [0]) asNumber @ (component attributeAt: #yOffset ifAbsent: [0]) asNumber negated * scaleFactor.

			self
				drawGlyph: (component attributeAt: #base)
				size: aPointSizeNumber
				on: aCanvas
				at: aPoint + offset
				color: aColor].
		
		^ advance].
	^ 0