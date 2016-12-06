segments
addLineSegmentFrom: aPoint to: anotherPoint
	| segment |
	segment := KRNLineMorph new
		startPoint: aPoint;
		endPoint: anotherPoint;
		yourself.
	self addSegment: segment