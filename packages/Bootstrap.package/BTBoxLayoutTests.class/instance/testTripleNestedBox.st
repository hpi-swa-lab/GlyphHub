nested
testTripleNestedBox
	" two horizontal expanders, the inner one centers itself though "
	| topLevel inner outer |
	inner := BTWidget new withLayout; align: #(center center); expand: true; color: Color green; minSize: 100 asPoint.
	outer := BTWidget new withLayout; align: #(fill fill); expand: true; color: Color red; add: inner.
	topLevel := BTTopLevel new size: 600 asPoint; add: outer; padding: 0; fullBounds; yourself.
	
	self
		assert: 600 @ 100 equals: topLevel extent;
		assert: 600 @ 100 equals: outer extent;
		assert: 100 asPoint equals: inner extent;
		assert: 250 @ 0 equals: inner position - topLevel position