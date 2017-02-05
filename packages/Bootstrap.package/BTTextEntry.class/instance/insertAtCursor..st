as yet unclassified
insertAtCursor: aString
	text := (text first: cursor), aString, (text allButFirst: cursor).
	self updateText: text