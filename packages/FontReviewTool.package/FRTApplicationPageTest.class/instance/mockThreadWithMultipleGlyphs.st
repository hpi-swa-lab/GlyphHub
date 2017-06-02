mock-data
mockThreadWithMultipleGlyphs

	| thread glyphUpperA |
	thread := FRTThread new
		title: 'Hello world!';
		closed: false.
		
	glyphUpperA := self mockGlyphUpperA.
	thread threadGlyphAssociations
		add: (FRTThreadGlyphAssociation new glyph: glyphUpperA; stringIndex: 0);
		add: (FRTThreadGlyphAssociation new glyph: self mockGlyphLowerA; stringIndex: 1);
		add: (FRTThreadGlyphAssociation new glyph: self mockGlyphLowerS; stringIndex: 2).
		
	thread comments
		add: (FRTComment new
			text: 'comment text';
			author: glyphUpperA font author;
			createdAt: DateAndTime yesterday).
	
	^ thread