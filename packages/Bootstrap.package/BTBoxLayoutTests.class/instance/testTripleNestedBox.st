nested
testTripleNestedBox
	| topLevel inner outer |
	inner := (BTPage new align: #(center center)) color: Color green; minSize: 100 asPoint.
	outer := (BTPage new align: #(expand expand)) color: Color red; add: inner.
	topLevel := BTTopLevel new size: 600 asPoint; add: outer; padding: 0; fullBounds; yourself.
	
	self
		assert: 600 asPoint equals: topLevel extent;
		assert: 600 asPoint equals: outer extent;
		assert: 100 asPoint equals: inner extent;
		assert: 250 asPoint equals: inner position - topLevel position