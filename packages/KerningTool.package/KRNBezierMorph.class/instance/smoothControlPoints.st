event handling
smoothControlPoints
	| offset |
	self owner ifNil: [ ^self ].
	
	offset := 100 asPoint.
	
	self controlPoint1: self startPoint + (self previousSegment
		ifNotNilDo: [ :previous | offset := previous endPoint - previous controlPoint2 ]
		ifNil: [ offset ]).
	
	self controlPoint2: self endPoint + (self nextSegment
		ifNotNilDo: [ :next | next startPoint - next controlPoint1 ]
		ifNil: [ offset ])