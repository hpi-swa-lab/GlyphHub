as yet unclassified
deleteAfterCursor
	cursor = self text size ifTrue: [ ^self ].
	
	text := (text first: cursor), (text allButFirst: cursor + 1).
	self updateText: text.
	self cursor: self cursor