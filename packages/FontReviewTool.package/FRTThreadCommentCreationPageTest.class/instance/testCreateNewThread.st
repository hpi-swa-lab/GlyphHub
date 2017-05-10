running
testCreateNewThread

	| title text |
	self setupForThreadCreated: false.
	
	title := 'This is my comment title'.
	text := 'This is my comment text'.
	
	(page findInputLabelled: 'Enter Thread Title') text: title.
	(page findInputLabelled: 'Comment ...') text: text.
	(self expect: page saveComment) to resolve.
	
	(self expect: self topLevel openPage) to haveText: 'Thread: ', title.
	(self expect: self topLevel openPage) to haveText: text