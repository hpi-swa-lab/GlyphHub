mock-data
mockThread

	| thread |
	thread := FRTThread new
		title: 'Hello world!';
		closed: false.
	thread threadGlyphAssociations add: (FRTThreadGlyphAssociation new glyph: self mockGlyph).
	
	^ thread