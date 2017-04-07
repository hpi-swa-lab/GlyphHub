callbacks
createNewThread

	| thread |
	thread := FRTThread new.
	thread glyphs add: self glyph.
	self topLevel openPage: (FRTCreateThreadCommentPage new thread: thread)