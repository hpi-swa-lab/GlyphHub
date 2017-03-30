accessing
commentThread: aCommentThread
	commentThread := aCommentThread.
	
	commentPreview text: commentThread comments first text.
	threadTitle bold: aCommentThread title.
	author secondary: 'by ', aCommentThread author userName.
	commentCount label: aCommentThread comments size asString, ' comments'