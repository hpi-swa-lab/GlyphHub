accessing
glyphNames: aGlyphNameStringCollection

	glyphNames := aGlyphNameStringCollection.
	self changed.
	
	((renderer loadDataFor: aGlyphNameStringCollection)
		then: [self changed; layoutChanged])
		whenRejected: #signal