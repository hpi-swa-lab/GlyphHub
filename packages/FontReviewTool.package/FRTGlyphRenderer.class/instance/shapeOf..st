helper-drawing
shapeOf: aGlyphNameString
	" returns the contours and unscaled advance width for the shape of the given glyph "
	
	| glif shapes advance |
	glif := glifs at: aGlyphNameString ifAbsent: [self error: 'Can''t draw requested glif, data not loaded yet. See #loadDataFor:'].
	
	glif ifNil: [^nil].
	
	shapes := OrderedCollection new.
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [:contour |
		(self pointsForContour: contour) ifNotEmptyDo: [:shape | shapes add: shape asPointArray]].
	
	advance := self advanceOf: glif.
	
	^ {shapes. advance}