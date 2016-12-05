as yet unclassified
path: aString
	| rects |
	
	[	self image: ((Form fromFileNamed: aString) colorToAlpha: Color white).
		rects := GlyphDetect new glyphDetect: aString
	] on: Error do: [ | example |
		example := GlyphDetect exampleData.
		UIManager default inform: 'OpenCV plugin for detecting glyph outlines could not be loaded. Displaying example data instead.'.
		self image: example second.
		rects := example first ].
	
	rects do: [ :rect |
		self addMorph: (KRNBitmapGlyphPickerRegionMorph new
			extent: rect extent;
			position: rect origin;
			yourself) ]