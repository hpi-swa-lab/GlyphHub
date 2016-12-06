event handling
update: aParameter with: anObject
	super update: aParameter.
	
	(aParameter == #closeContourRequested and: [anObject == startPoint and: [self == self owner firstSubmorph]]) ifTrue: [ 
		self owner close ].
	
	aParameter == #pointMoved ifTrue: [ self syncConnections: anObject ]