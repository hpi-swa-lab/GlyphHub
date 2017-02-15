spacing
testSpacingTwoChildren
	| child1 child2 topLevel |
	self horizontalAndVerticalDo: [ :vertical |
		child1 := BTWidget new color: Color red; minSize: 100 asPoint.
		child2 := BTWidget new color: Color green; minSize: 100 asPoint.
		topLevel := BTTopLevel new add: child1; add: child2; extent: 200 @ 100; vertical: vertical; spacing: 20; padding: 0; fullBounds; yourself.
		
		self
			assert: 100 asPoint equals: child1 extent;
			assert: 100 asPoint equals: child2 extent;
			assert: (self flipPoint: 120 @ 0) equals: child2 position - child1 position ]