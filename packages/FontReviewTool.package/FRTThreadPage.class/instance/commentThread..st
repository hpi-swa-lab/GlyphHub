accessing
commentThread: aCommentThread

	commentThread := aCommentThread.
	
	title heading: 'Thread: ', aCommentThread title.
	self
		"loadTags;"
		loadComments;
		changed