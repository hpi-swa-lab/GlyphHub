as yet unclassified
extent: aPoint
	super extent: (self form ifNil: [ 0 @ 0 ] ifNotNil: [ self preferredExtent ])