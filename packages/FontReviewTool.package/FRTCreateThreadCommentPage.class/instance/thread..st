accessing
thread: aThread

	thread := aThread.
	
	self
		updateTitle: aThread;
		updateGlyphLinks: aThread.
	preview thread: aThread