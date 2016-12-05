initialize-release
update: aParameter with: aPoint
	super update: aParameter.
	
	(aParameter == #closeContourRequested and: [aPoint == startPoint and: [self == self owner firstSubmorph]]) ifTrue: [ | segment |
		closed := true.
		segment := KRNBezierMorph new startPoint: (self owner lastSubmorph endPoint); endPoint: (self owner firstSubmorph startPoint).
		self owner addSegment: segment.
		segment smoothControlPoints ].
	
	aParameter == #pointMoved ifTrue: [
		self
			syncConnections;
			updateExtent ]