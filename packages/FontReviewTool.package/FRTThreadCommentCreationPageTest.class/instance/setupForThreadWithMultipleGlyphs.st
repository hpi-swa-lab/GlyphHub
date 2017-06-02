running
setupForThreadWithMultipleGlyphs
	
	thread := self mockThreadWithMultipleGlyphs.
	
	super
		setUpForPage: FRTThreadCommentCreationPage new
		with: {thread. nil}
		prepare: [:topLevel | topLevel addEntity: thread]