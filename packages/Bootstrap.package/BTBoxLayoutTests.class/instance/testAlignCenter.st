aligning
testAlignCenter
	| child data topLevel |
	data := self setupAlignTest: #(center center).
	child := data first.
	topLevel := data second.
	topLevel openInWorld.
	Transcript show: child align; cr.
	
	self
		assert: 100 asPoint equals: topLevel extent;
		assert: 50 asPoint equals: child extent;
		assert: 25 asPoint equals: child position - topLevel position.
	
	child align: #(center start).
	topLevel fullBounds.
	self assert: 25 @ 0 equals: child position - topLevel position.
	
	child align: #(start center).
	topLevel fullBounds.
	self assert: 0 @ 25 equals: child position - topLevel position