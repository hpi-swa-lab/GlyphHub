event handling
smoothControlPoints
	self owner ifNil: [ ^self ].
	
	self startPointMorph smooth ifTrue: [  
		self previousSegment
			ifNotNilDo: [ :previous | self controlPoint1: self startPoint + previous endPoint - previous controlPoint2 ] ].
	
	self endPointMorph smooth ifTrue: [
		self nextSegment
			ifNotNilDo: [ :next | self controlPoint2: self endPoint + next startPoint - next controlPoint1 ] ]