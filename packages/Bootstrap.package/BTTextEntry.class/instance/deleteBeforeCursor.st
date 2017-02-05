as yet unclassified
deleteBeforeCursor
	cursor = 0 ifTrue: [ ^self ].
	
	text := (text first: cursor - 1), (text allButFirst: cursor).
	self updateText: text.
	self cursor: self cursor - 1