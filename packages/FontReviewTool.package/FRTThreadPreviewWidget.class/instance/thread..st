accessing
thread: aThread

	| firstComment |
	thread := aThread.
	firstComment := (thread comments sortedBy: #id) first.
	
	commentPreview text: firstComment text.
	threadTitle text: aThread title.
	author text: 'by ', firstComment author username.
	commentCount text:  (BTIcon icon: #comments_o), ' ', aThread comments size asString, ' comments'