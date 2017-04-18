callbacks
createNewThread

	| thread |
	thread := FRTThread new.
	thread threadGlyphAssociations add: (FRTThreadGlyphAssociation new
		glyph: self glyph;
		thread: thread;
		yourself).
	self topLevel openPage: FRTThreadCommentCreationPage new with: {thread. self glyph}