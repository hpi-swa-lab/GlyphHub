as yet unclassified
mouseDown: evt
	self ref: self center - evt position.
	
	evt shiftPressed ifTrue: [
		self changed: #closeContourRequested with: self ]