accessing
enteringWith: aThread

	self
		thread: aThread;
		updateTitle: aThread;
		updateGlyphLinks: aThread.
	
	preview thread: aThread.
	
	^ Promise unit: nil