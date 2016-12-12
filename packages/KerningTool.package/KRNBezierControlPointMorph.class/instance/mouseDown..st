event handling
mouseDown: evt
	ref := evt position.
	
	evt yellowButtonPressed ifTrue: [
		self handleType: (self handleType = #auto ifTrue: [#free] ifFalse: [#auto]).
		self changed: #handleType with: self ].
	
	evt redButtonPressed ifTrue: [ self notifyEditor ].
	
	(evt redButtonPressed and: [evt shiftPressed]) ifTrue: [
		self changed: #closeContourRequested with: self ]