drawing
drawOn: aCanvas at: aPoint
	aCanvas translucentImage: self ftForm at: aPoint.
	
	components do: [ :glyph | glyph drawOn: aCanvas at: aPoint + glyph transform offset ]