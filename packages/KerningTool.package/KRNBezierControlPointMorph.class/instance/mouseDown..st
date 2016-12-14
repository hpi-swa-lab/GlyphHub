event handling
mouseDown: evt
	ref := self center - evt position.
	
	evt yellowButtonPressed ifTrue: [
		KRNHandleTypePickerMorph new
			openFor: self;
			onSelected: [ :type |
				self handleType: type.
				self changed: #handleType with: self ]].
	
	evt redButtonPressed ifTrue: [ self notifyEditor: #down].
	
	(evt redButtonPressed and: [evt shiftPressed]) ifTrue: [
		self changed: #closeContourRequested with: self ]