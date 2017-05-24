helper-drawing
shapeOf: aGlyphNameString
	" returns the contours and unscaled advance width for the shape of the given glyph "
	
	| glif |
	glif := self glifNamed: aGlyphNameString ifNotLoaded: [self error: 'Can''t draw requested glif, data not loaded yet. See #loadDataFor:'].
	
	glif ifNil: [^ nil].
	
	^ {self shapeOfGlif: glif. self advanceOf: glif}