initialize-release
update: aParameter with: anObject
	super update: aParameter.
	
	(aParameter == #closeContourRequested and: [anObject == startPoint and: [self == self owner firstSubmorph]]) ifTrue: [ 
		closed := true.
		self owner addSmoothSegmentFrom: self owner lastSubmorph endPoint to: self owner firstSubmorph startPoint ].
	
	aParameter == #pointMoved ifTrue: [
		self syncConnections: anObject ]