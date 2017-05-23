thread
updateLastVisited: aThreadOrId

	| threadId |
	threadId := aThreadOrId isBTModel ifTrue: [aThreadOrId id] ifFalse: [aThreadOrId].
	
	^ self
		request: 'thread/', threadId, '/visit'
		method: 'PATCH'
		data: nil