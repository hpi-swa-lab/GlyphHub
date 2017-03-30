accessing
commentThread: aCommentThread
	commentThread := aCommentThread.
	
	title text: 'Thread: ', aCommentThread title.
	self loadTags.
	self loadComments.