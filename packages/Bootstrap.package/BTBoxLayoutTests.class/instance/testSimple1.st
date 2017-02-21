simple
testSimple1
	| child topLevel |
	child := self widget minSize: 100 asPoint.
	topLevel := self horizontalTopLevel add: child; fullBounds; yourself.
	
	self
		assert: 100 asPoint equals: topLevel extent;
		assert: 100 asPoint equals: child extent