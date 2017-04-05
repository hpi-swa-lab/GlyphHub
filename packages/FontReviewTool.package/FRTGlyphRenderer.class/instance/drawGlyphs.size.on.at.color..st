drawing
drawGlyphs: aGlyphNameStringCollection size: aNumber on: aCanvas at: aPoint color: aColor
	
	| x scaleFactor |
	x := 0.
	scaleFactor := self scaleFactorAt: aNumber.
	
	aGlyphNameStringCollection do: [:glyphName | | shape advance data |
		data := self shapeOf: glyphName.
		shape := data first.
		advance := data second.
		self drawGlyphShape: shape scaleFactor: scaleFactor on: aCanvas at: aPoint + (x @ 0) color: aColor.
		x := x + (advance * scaleFactor)]