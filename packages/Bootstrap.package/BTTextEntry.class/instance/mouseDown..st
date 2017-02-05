as yet unclassified
mouseDown: anEvent
	| data index position trailing |
	anEvent hand newKeyboardFocus: self.
	
	" catch case where we would jump at cursor pos of the placeholder "
	self text ifEmpty: [
		self cursor: 0.
		^self ].
	
	position := anEvent position - self layoutBounds origin.
	data := self layout indexForPosition: position.
	
	index := data second.
	trailing := data third.

	self cursor: index + trailing