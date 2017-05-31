accessing
lastVisited: aDateAndTimeOrNil

	aDateAndTimeOrNil
		ifNil: [
			" if we don't have a timestamp, we mark everything as read by using a timestamp in the future "
			lastVisited := DateAndTime nowAtOffset: 1 hour]
		ifNotNil: [lastVisited := aDateAndTimeOrNil].
	
	((self comment createdAt > self lastVisited) and:
	[self comment author id ~= self topLevel user id]) ifTrue: [
		self color: self newCommentColor]