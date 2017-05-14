as yet unclassified
mouseDown: anEvent

	anEvent redButtonPressed ifTrue: [
		self formerPosition: anEvent position]