event handling
syncConnections: pointAndDelta
	| delta point prev next |
	point := pointAndDelta first.
	delta := pointAndDelta second.
	
	prev := self previousSegment ifNil: [ KRNBezierMorph new ].
	next := self nextSegment ifNil: [ KRNBezierMorph new ].
	
	point == startPoint ifTrue: [
		prev endPoint: self startPoint; controlPoint2: prev controlPoint2 + delta.
		self controlPoint1: self controlPoint1 + delta ].
	
	point == endPoint ifTrue: [
		next startPoint: self endPoint; controlPoint1: next controlPoint1 + delta.
		self controlPoint2: self controlPoint2 + delta ].
	
	point == controlPoint1 ifTrue: [ prev smoothControlPoints ].
	point == controlPoint2 ifTrue: [ next smoothControlPoints ].
	
	next updateExtent.
	prev updateExtent.
	self updateExtent