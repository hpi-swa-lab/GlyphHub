accessing
thread: aThread

	| firstComment |
	thread := aThread.
	firstComment := (thread comments sortedBy: #id) first.
	
	commentPreview text: firstComment text.
	threadTitle bold: aThread title.
	author secondary: 'by ', firstComment author username.
	commentCount text:  (BTIcon icon: #comments_o), ' ', aThread comments size asString, ' comments'