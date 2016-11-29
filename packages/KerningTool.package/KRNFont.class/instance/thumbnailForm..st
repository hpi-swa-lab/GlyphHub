as yet unclassified
thumbnailForm: aNumber
	| canvas form letterA ptSize verticalCenter |
	form := Form extent: aNumber asPoint depth: 32.
	canvas := FormCanvas on: form.
	
	ptSize := aNumber / ((self advanceOf: $A) x + (self advanceOf: $a) x / self unitsPerEm).
	verticalCenter := aNumber / 2 - (self height * (self scaleAtPtSize: ptSize) / 2).
	
	letterA := (self createGlyphFor: $A ptSize: ptSize)
		position: 0 @ verticalCenter;
		drawOn: canvas;
		yourself.
	
	(self createGlyphFor: $a ptSize: ptSize)
		position: letterA extent x @ verticalCenter;
		drawOn: canvas.
	
	^form