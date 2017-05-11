testing
testCommentOnThread

	| text |
	self setupForThreadCreated: true.
	
	text := 'This is my comment text'.
	
	(self expect: self topLevel openPage) to haveText: thread title.
	(page findInputLabelled: 'Comment ...') text: text.
	(self expect: page saveComment) to resolve.
	
	(self expect: self topLevel openPage) to haveText: 'Thread: ', thread title.
	(self expect: self topLevel openPage) to haveText: text