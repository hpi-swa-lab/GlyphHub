event handling
smoothControlPoints
	self owner ifNil: [ ^self ].
	
	(#(auto aligned) includes: self startPointMorph handleType) ifTrue: [  
		self previousSegment
			ifNotNilDo: [ :previous | self controlPoint1: self startPoint + previous endPoint - previous controlPoint2 ] ].
	
	(#(auto aligned) includes: self endPointMorph handleType) ifTrue: [
		self nextSegment
			ifNotNilDo: [ :next | self controlPoint2: self endPoint + next startPoint - next controlPoint1 ] ]