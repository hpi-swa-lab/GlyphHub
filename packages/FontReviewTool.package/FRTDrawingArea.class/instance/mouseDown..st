event handling
mouseDown: anEvent

	mouseIsDown := true.
	
	self pen place: anEvent position - self innerBounds origin