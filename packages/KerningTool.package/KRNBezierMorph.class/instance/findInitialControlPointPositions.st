initialize-release
findInitialControlPointPositions
	self startPointMorph smooth
		ifTrue: [ self smoothControlPoints ]
		ifFalse: [
			self previousSegment ifNotNilDo: [ :previous |
			self controlPoint1: self startPoint + previous endPoint - previous controlPoint2 ]].
	
	self controlPoint2: self endPoint + (self controlPoint1 - self startPoint)