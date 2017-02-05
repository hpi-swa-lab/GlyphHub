as yet unclassified
mouseDown: anEvent
	| data index position trailing |
	anEvent hand newKeyboardFocus: self.

	position := anEvent position - self layoutBounds origin.
	data := self primLayout: layout indexForPosition: position.
	
	index := data second.
	trailing := data third.

	self cursor: index + trailing