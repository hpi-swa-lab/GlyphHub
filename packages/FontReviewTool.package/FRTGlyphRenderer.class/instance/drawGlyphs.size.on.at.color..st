drawing
drawGlyphs: aGlyphNameStringCollection size: aPointSizeNumber on: aCanvas at: aPoint color: aColor
	
	| currentGlyphXPosition scaleFactor |
	currentGlyphXPosition := 0.
	scaleFactor := self scaleFactorAt: aPointSizeNumber.
	
	aGlyphNameStringCollection do: [:glyphName | | shape advance shapeAndAdvanceTuple |
		shapeAndAdvanceTuple := self shapeOf: glyphName.
		shape := shapeAndAdvanceTuple first.
		advance := shapeAndAdvanceTuple second.
		self
			drawGlyphShape: shape
			scaleFactor: scaleFactor
			on: aCanvas
			at: aPoint + (currentGlyphXPosition @ 0)
			color: aColor.
		currentGlyphXPosition := currentGlyphXPosition + (advance * scaleFactor)]