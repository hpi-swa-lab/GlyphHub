as yet unclassified
mouseDown: evt
	evt shiftPressed ifTrue: [ | segment |
		segment := KRNBezierMorph new
			startPoint: self lastSubmorph endPoint;
			endPoint: evt position;
			yourself.
		self addSegment: segment.
		segment smoothControlPoints ].