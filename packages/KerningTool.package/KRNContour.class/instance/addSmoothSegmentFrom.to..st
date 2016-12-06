segments
addSmoothSegmentFrom: aPoint to: anotherPoint
	| segment |
	segment := KRNBezierMorph new
		startPoint: aPoint;
		endPoint: anotherPoint;
		yourself.
	
	self addSegment: segment.
	
	segment findInitialControlPointPositions