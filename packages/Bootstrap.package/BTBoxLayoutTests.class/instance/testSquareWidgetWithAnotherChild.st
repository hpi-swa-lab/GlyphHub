height-for-width
testSquareWidgetWithAnotherChild
	| topLevel widget child |
	self horizontalAndVerticalDo: [ :vertical |
		widget := self squareWidget minSize: 100 asPoint.
		child := self widget minSize: 100 asPoint.
		topLevel := (self topLevel: vertical) add: widget; add: child; fullBounds; yourself.
		
		self
			assert: 500 asPoint equals: widget extent;
			assert: (self flipPoint: 600 @ 500) equals: topLevel extent.
		
		topLevel extent: 700 asPoint; fullBounds.
		
		self
			assert: 600 asPoint equals: widget extent;
			assert: (self flipPoint: 700 @ 600) equals: topLevel extent.
		
		topLevel extent: (self flipPoint: 200 @ 600); fullBounds.
		
		self
			assert: 100 asPoint equals: widget extent;
			assert: (self flipPoint: 200 @ 100) equals: topLevel extent.

		topLevel extent: (self flipPoint: 400 @ 200); fullBounds.
		
		self
			assert: 300 asPoint equals: widget extent;
			assert: (self flipPoint: 300 @ 200) equals: topLevel extent ]