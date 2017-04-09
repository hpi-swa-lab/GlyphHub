drawing
formForGlyphs: aGlyphNameStringCollection size: aPointSizeNumber color: aColor
	
	| canvas form |
	form := Form extent: (self extentOf: aGlyphNameStringCollection size: aPointSizeNumber) depth: 32.
	canvas := BalloonCanvas on: form.
	
	self drawGlyphs: aGlyphNameStringCollection size: aPointSizeNumber on: canvas at: 0 @ 0 color: aColor.
	
	^ form