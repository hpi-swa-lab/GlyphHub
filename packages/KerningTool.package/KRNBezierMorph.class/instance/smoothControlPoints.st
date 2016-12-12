event handling
smoothControlPoints
	self owner ifNil: [ ^self ].
	
	self previousSegment
		ifNotNilDo: [ :previous |
			self controlPoint1: (self
				smoothControlPoint: self controlPoint1
				anchor: self startPoint
				otherControl: previous controlPoint2
				handleType: self startPointMorph handleType) ].
	
	self nextSegment
		ifNotNilDo: [ :next |
			self controlPoint2: (self
				smoothControlPoint: self controlPoint2
				anchor: self endPoint
				otherControl: next controlPoint1
				handleType: self endPointMorph handleType) ]