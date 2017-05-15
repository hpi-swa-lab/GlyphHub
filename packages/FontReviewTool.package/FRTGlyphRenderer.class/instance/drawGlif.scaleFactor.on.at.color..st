helper-drawing
drawGlif: aGlif scaleFactor: aNumber on: aCanvas at: aPoint color: aColor
	
	self drawGlyphShape: (self shapeOfGlif: aGlif) scaleFactor: aNumber on: aCanvas at: aPoint color: aColor