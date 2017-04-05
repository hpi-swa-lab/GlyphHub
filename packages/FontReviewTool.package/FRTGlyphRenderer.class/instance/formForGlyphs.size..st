drawing
formForGlyphs: aGlyphNameStringCollection size: aNumber
	
	| canvas form |
	form := Form extent: (self extentOf: aGlyphNameStringCollection size: aNumber) depth: 32.
	canvas := BalloonCanvas on: form.
	
	self drawGlyphs: aGlyphNameStringCollection size: aNumber on: canvas at: 0 @ 0 color: Color red.
	
	^ form