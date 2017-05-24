accessing
thread: aThread

	thread := aThread.
	threadTitle text: aThread title.
	self updateOpenClosedBadge.
	(thread comments sortedBy: #id) ifNotEmptyDo: [:list | | firstComment |
		firstComment := list first.
		latestComment := list last.
	
		commentPreview text: firstComment text.
		author text: 'by ', firstComment author username].
	
	^ self updateCommentCount