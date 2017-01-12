as yet unclassified
commentThread: aCommentThread
	commentThread := aCommentThread.
	
	isOpen checked: commentThread checked.
	aCommentThread comments reverseDo: [ :comment |
		commentsList addMorphFront: comment asMorph ]