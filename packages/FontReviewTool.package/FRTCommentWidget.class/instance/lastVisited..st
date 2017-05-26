accessing
lastVisited: aDateAndTimeOrNil

	aDateAndTimeOrNil
		ifNil: [lastVisited := DateAndTime tomorrow]
		ifNotNil: [lastVisited := aDateAndTimeOrNil].
	
	
	((comment createdAt > self lastVisited) and: [comment author id ~= self topLevel user id]) ifTrue: [
		self color: self newCommentColor]