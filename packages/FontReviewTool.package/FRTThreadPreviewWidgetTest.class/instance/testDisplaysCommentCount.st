as yet unclassified
testDisplaysCommentCount

	| previewWidget comment |
	previewWidget := FRTThreadPreviewWidget new.
	self topLevel add: previewWidget.
	(self expect: (previewWidget thread: thread)) to resolve.
	(self expect: previewWidget) to haveText: ((BTIcon icon: #comments), ' New comments').
	
	(self expect: (self topLevel updateLastVisited: thread)) to resolve.
	(self expect: (previewWidget thread: thread)) to resolve.
	(self expect: previewWidget) to haveText: ((BTIcon icon: #comments_o), ' 1 comment').
	
	subscription lastVisited: DateAndTime yesterday.
	comment := FRTComment new
		text: 'blah';
		thread: thread;
		author: self topLevel user.
	
	subscription lastVisited: DateAndTime now.
	(self expect: (previewWidget thread: thread)) to resolve.
	(self expect: previewWidget) to haveText: ((BTIcon icon: #comments_o), ' 2 comments')