as yet unclassified
path: aString
	self image: ((Form fromFileNamed: aString) colorToAlpha: Color white).
	
	(GlyphDetect new glyphDetect: aString) do: [ :rect |
		self addMorph: (KRNBitmapGlyphPickerRegionMorph new
			extent: rect extent;
			position: rect origin;
			yourself) ]