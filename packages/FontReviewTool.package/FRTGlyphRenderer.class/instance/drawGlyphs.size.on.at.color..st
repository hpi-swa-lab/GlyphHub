drawing
drawGlyphs: aGlyphNameStringCollection size: aPointSizeNumber on: aCanvas at: aPoint color: aColor
	
	| currentGlyphXPosition scaleFactor |
	currentGlyphXPosition := 0.
	scaleFactor := self scaleFactorAt: aPointSizeNumber.
	
	aGlyphNameStringCollection do: [:glyphName | | advance |
		advance := self
			drawGlyph: glyphName
			size: aPointSizeNumber
			on: aCanvas
			at: aPoint + (currentGlyphXPosition @ 0)
			color: aColor.
		
		currentGlyphXPosition := currentGlyphXPosition + (advance * scaleFactor)]