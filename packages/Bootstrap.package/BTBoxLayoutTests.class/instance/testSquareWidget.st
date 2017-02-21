height-for-width
testSquareWidget
	| topLevel widget |
	self horizontalAndVerticalDo: [ :vertical |
		widget := self squareWidget minSize: 100 asPoint.
		topLevel := (self topLevel: vertical) add: widget; fullBounds; yourself.
		
		self
			assert: 600 asPoint equals: widget extent;
			assert: 600 asPoint equals: topLevel extent.
		
		topLevel extent: 650 asPoint; fullBounds.
		
		self
			assert: 650 asPoint equals: widget extent;
			assert: 650 asPoint equals: topLevel extent.
		
		topLevel extent: 200 @ 600; fullBounds.
		
		self
			assert: 200 asPoint equals: widget extent;
			assert: 200 asPoint equals: topLevel extent.

		topLevel extent: 400 @ 200; fullBounds.
		
		self
			assert: 400 asPoint equals: widget extent;
			assert: 400 asPoint equals: topLevel extent ]