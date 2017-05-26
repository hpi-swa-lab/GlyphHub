running
setUp

	| glyph |
	thread := self mockThread.
	glyph := thread threadGlyphAssociations anyOne glyph.
	self setUpForPage: FRTGlyphPage new with: glyph prepare: [:topLevel | topLevel addEntity: thread]