event handling
mouseMove: anEvent

	mouseIsDown ifTrue: [
		self pen goto: anEvent position - self innerBounds origin.
		self changed]