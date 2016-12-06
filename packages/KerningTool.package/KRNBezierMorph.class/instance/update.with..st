event handling
update: aParameter with: anObject
	super update: aParameter.
	
	(aParameter == #closeContourRequested and: [anObject == startPoint and: [self == self owner firstSubmorph]]) ifTrue: [ 
		self owner close ].
	
	aParameter == #smooth ifTrue: [
		(anObject == startPoint or: [anObject == controlPoint1]) ifTrue: [ self markStartSmooth: anObject smooth ].
		(anObject == endPoint or: [anObject == controlPoint2]) ifTrue: [ self markEndSmooth: anObject smooth ].
		self smoothControlPoints ].
	
	aParameter == #pointMoved ifTrue: [ self syncConnections: anObject ]