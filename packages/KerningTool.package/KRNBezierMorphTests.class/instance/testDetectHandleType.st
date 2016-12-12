as yet unclassified
testDetectHandleType
	| contour |
	contour := KRNContour new
		addSegment: (KRNBezierMorph newFrom: 100 @ 100 via: 50 @ 100 and: 0 @ 75 to: 0 @ 50);
		addSegment: (KRNBezierMorph newFrom: 0 @ 50 via: 0 @ 25 and: 50 @ 0 to: 100 @ 0);
		addSegment: (KRNBezierMorph newFrom: 100 @ 0 via: 75 @ 0 and: 75 @ 30 to: 100 @ 30);
		addSegment: (KRNBezierMorph newFrom: 100 @ 30 via: 130 @ 10 and: 160 @ 10 to: 200 @ 30);
		addSegment: (KRNLineMorph newFrom: 200 @ 30 to: 250 @ 30);
		detectHandleTypes;
		yourself.
	
	self
		assert: #auto equals: contour submorphs first endPointMorph handleType;
		assert: #aligned equals: contour submorphs second endPointMorph handleType;
		assert: #free equals: contour submorphs third endPointMorph handleType;
		assert: #free equals: contour submorphs fourth endPointMorph handleType