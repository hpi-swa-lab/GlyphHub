event handling
mouseDown: evt
	evt shiftPressed ifTrue: [ 
		evt redButtonPressed ifTrue: [
			self addSmoothSegmentFrom: self lastSubmorph endPoint to: evt position ].
		
		evt yellowButtonPressed ifTrue: [
			self addLineSegmentFrom: self lastSubmorph endPoint to: evt position ]]