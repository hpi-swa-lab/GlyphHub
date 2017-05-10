mock-data
mockThread

	| thread |
	thread := FRTThread new title: 'Hello world!'.
	thread threadGlyphAssociations add: (FRTThreadGlyphAssociation new glyph: self mockGlyph).
	
	^ thread