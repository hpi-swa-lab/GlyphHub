height-for-width
testLabelWithAnotherChild
	| topLevel label child linesAtSize |
	self horizontalAndVerticalDo: [ :vertical |
		label := self label.
		child := self widget minSize: 100 asPoint.
		topLevel := (self topLevel: vertical)
			add: label;
			add: child;
			extent: 600 asPoint;
		 fullBounds;
			yourself.
	
		linesAtSize := label numberOfLetters * BTFakeLabel letterWidth // topLevel extent x.
		
		self
			assert: 600 asPoint equals: topLevel extent;
			assert: 500 @  (linesAtSize * BTFakeLabel lineHeight) equals: label extent ]