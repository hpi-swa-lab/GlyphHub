nested
testNestedHorizontalAndVerticalSingleChildExpanding
	| child horizontal vertical |
	child := BTWidget new minSize: 100 asPoint.
	vertical := BTWidget new vertical: true; align: #(fill fill); expand: true; withLayout; add: child.
	horizontal := BTTopLevel new extent: 600 asPoint; expand: true; vertical: false; spacing: 0; padding: 0; add: vertical; fullBounds.
	
	self
		assert: 100 asPoint equals: child extent;
		assert: 600 asPoint equals: vertical extent;
		assert: 600 asPoint equals: horizontal extent.
	
	vertical extent: 5 asPoint; fullBounds.
	
	self assert: 100 asPoint equals: vertical extent