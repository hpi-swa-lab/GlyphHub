two-children
testTwoChildrenExpand
	| child1 child2 topLevel |
	self horizontalAndVerticalDo: [ :vertical |  
		child1 := BTWidget new color: Color red; minSize: 150 asPoint; align: #(expand expand).
		child2 := BTWidget new color: Color green; minSize: 150 asPoint; align: #(expand expand).
		topLevel := BTTopLevel new add: child1; add: child2; extent: 600 asPoint; vertical: vertical; spacing: 0; padding: 0; fullBounds; yourself.
		
		self
			assert: 600 asPoint equals: topLevel extent;
			assert: (self flipPoint: 300 @ 600) equals: child1 extent;
			assert: (self flipPoint: 300 @ 600) equals: child2 extent;
			assert: (self flipPoint: 300 @ 0) equals: child2 position - child1 position.
			
		topLevel extent: 300 asPoint; fullBounds.
		
		self
			assert: (self flipPoint: 150 @ 300) equals: child1 extent;
			assert: (self flipPoint: 150 @ 300) equals: child2 extent ]