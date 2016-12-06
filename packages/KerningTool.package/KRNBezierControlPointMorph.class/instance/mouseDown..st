event handling
mouseDown: evt
	ref := evt position.
	
	evt yellowButtonPressed ifTrue: [
		self smooth: self smooth not.
		self changed: #smooth with: self ].
	
	(evt redButtonPressed and: [evt shiftPressed]) ifTrue: [
		self changed: #closeContourRequested with: self ]