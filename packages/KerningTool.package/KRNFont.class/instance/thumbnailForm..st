as yet unclassified
thumbnailForm: aNumber
	| canvas form letterA ptSize verticalCenter letters |
	form := Form extent: aNumber asPoint depth: 32.
	canvas := FormCanvas on: form.
	
	letters := self thumbnailGlyphs ifEmpty: [ ^form ].
	ptSize := aNumber / ((self advanceOf: letters first) x + (self advanceOf: letters second) x / self unitsPerEm).
	verticalCenter := aNumber / 2 - (self height * (self scaleAtPtSize: ptSize) / 2).
	
	letterA := (self createGlyphFor: letters first ptSize: ptSize)
		position: 0 @ verticalCenter;
		drawOn: canvas;
		yourself.
	
	(self createGlyphFor: letters second ptSize: ptSize)
		position: letterA extent x @ verticalCenter;
		drawOn: canvas.
	
	^form