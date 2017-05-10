as yet unclassified
setUp

	thread := self mockThread.
	super setUpForPage: FRTThreadPage new with: {thread. nil} prepare: [:topLevel | topLevel addEntity: thread]