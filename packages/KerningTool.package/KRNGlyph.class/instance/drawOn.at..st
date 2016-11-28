drawing
drawOn: aCanvas at: aPoint
	self outline drawOn: aCanvas at: (0 @ self font ascender * self scale) floor.
	
	components do: [ :glyph | glyph drawOn: aCanvas at: aPoint + glyph transform offset ]