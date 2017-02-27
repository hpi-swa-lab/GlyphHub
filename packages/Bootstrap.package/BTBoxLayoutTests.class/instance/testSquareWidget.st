height-for-width
testSquareWidget
	| topLevel widget |
	self horizontalAndVerticalDo: [ :vertical |
		widget := self squareWidget minSize: 100 asPoint.
		topLevel := (self topLevel: vertical) add: widget; extent: 600 asPoint; fullBounds; yourself.
		
		self
			assert: 600 asPoint equals: topLevel extent;
			assert: 100 asPoint equals: widget extent.
		
		topLevel extent: 650 asPoint; fullBounds.
		
		self
			assert: 100 asPoint equals: widget extent;
			assert: 650 asPoint equals: topLevel extent ]