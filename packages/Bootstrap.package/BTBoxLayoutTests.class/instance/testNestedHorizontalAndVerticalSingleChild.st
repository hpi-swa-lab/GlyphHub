nested
testNestedHorizontalAndVerticalSingleChild
	| child horizontal vertical |
	child := BTWidget new minSize: 100 asPoint.
	horizontal := BTTopLevel new extent: 600 asPoint; vertical: false; spacing: 0; padding: 0.
	vertical := BTWidget new vertical: true; withLayout.
	
	vertical add: child.
	horizontal add: vertical; fullBounds.
	
	self
		assert: 100 asPoint equals: child extent;
		assert: 100 asPoint equals: vertical extent;
		assert: 100 asPoint equals: horizontal extent