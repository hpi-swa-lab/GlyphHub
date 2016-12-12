event handling
update: aParameter with: anObject
	super update: aParameter.
	
	(aParameter == #closeContourRequested and: [anObject == startPoint and: [self == self owner firstSubmorph]]) ifTrue: [ 
		self owner close ].
	
	aParameter == #handleType ifTrue: [
		(anObject == startPoint or: [anObject == controlPoint1]) ifTrue: [ self handleTypeStart:  anObject handleType ].
		(anObject == endPoint or: [anObject == controlPoint2]) ifTrue: [ self handleTypeEnd: anObject handleType ].
		self smoothControlPoints ].
	
	aParameter == #pointMoved ifTrue: [ self syncConnections: anObject ]