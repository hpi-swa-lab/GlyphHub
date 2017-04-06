accessing
glyphNames: aGlyphNameStringCollection

	glyphNames := aGlyphNameStringCollection.
	self changed.
	
	((renderer loadDataFor: aGlyphNameStringCollection)
		then: [:x | self changed])
		whenRejected: #signal