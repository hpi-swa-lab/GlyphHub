drawing
formForGlyphs: aGlyphNameStringCollection size: aPointSizeNumber
	
	| canvas form |
	form := Form extent: (self extentOf: aGlyphNameStringCollection size: aPointSizeNumber) depth: 32.
	canvas := BalloonCanvas on: form.
	
	self drawGlyphs: aGlyphNameStringCollection size: aPointSizeNumber on: canvas at: 0 @ 0 color: Color red.
	
	^ form