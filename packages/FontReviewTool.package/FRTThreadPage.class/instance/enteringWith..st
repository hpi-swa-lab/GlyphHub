accessing
enteringWith: aThread

	self thread: aThread.
	
	title heading: 'Thread: ', aThread title.
	preview thread: aThread.
	
	self
		loadComments;
		changed.
		
	^ Promise unit: nil