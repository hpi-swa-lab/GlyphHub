as yet unclassified
mouseDown: evt
	ref := evt position.
	
	evt shiftPressed ifTrue: [
		self changed: #closeContourRequested with: self ]