nested
testNestedHorizontalAndVerticalSingleChildExpanding
	| child horizontal vertical |
	child := BTWidget new minSize: 100 asPoint.
	horizontal := BTTopLevel new extent: 600 asPoint; vertical: false; spacing: 0; padding: 0.
	vertical := BTWidget new vertical: true; align: #(expand expand); withLayout.
	
	vertical add: child.
	horizontal add: vertical; fullBounds.
	
	self
		assert: 100 asPoint equals: child extent;
		assert: 100 asPoint equals: vertical extent;
		assert: 600 asPoint equals: horizontal extent.
		
	vertical extent: 5 asPoint; fullBounds.
	
	self assert: 100 asPoint equals: vertical extent