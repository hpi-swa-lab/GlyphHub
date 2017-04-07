accessing
thread: aThread

	thread := aThread.
	
	title heading: 'Thread: ', aThread title.
	preview thread: aThread.
	self
		"loadTags;"
		loadComments;
		changed