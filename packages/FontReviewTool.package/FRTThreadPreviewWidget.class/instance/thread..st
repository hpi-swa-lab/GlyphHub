accessing
thread: aThread

	thread := aThread.
	threadTitle text: aThread title.
	commentCount text:  (BTIcon icon: #comments_o), ' ', aThread comments size asString, ' comments'.
	self updateOpenClosedBadge.
	
	(thread comments sortedBy: #id) ifNotEmptyDo: [:list | | firstComment |
		firstComment := list first.
	
		commentPreview text: firstComment text.
		author text: 'by ', firstComment author username]