as yet unclassified
mouseDown: evt
	evt shiftPressed ifTrue: [ 
		self addSmoothSegmentFrom: self lastSubmorph endPoint to: evt position ]