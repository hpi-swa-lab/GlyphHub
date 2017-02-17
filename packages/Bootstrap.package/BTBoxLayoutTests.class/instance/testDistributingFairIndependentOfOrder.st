distributing-space
testDistributingFairIndependentOfOrder
	" we want to maximize the number of filled children, so we start giving to the ones with
	  the smallest size delta. We also want to be stable in order, so always prefer the first
	  medium children before the other medium children in size "
	| largeChild mediumChild1 mediumChild2 mediumChild3 smallChild topLevel |
	smallChild := self widget minSize: 10 asPoint; maxSize: 10 asPoint.
	mediumChild1 := self widget minSize: 20 @ 10; maxSize: 50 @ 10.
	mediumChild2 := self widget minSize: 20 @ 10; maxSize: 50 @ 10.
	mediumChild3 := self widget minSize: 20 @ 10; maxSize: 50 @ 10.
	largeChild := self widget minSize: 40 @ 10; maxSize: 100 @ 10.
	topLevel := self horizontalTopLevel
		size: 200 @ 10;
		add: mediumChild1;
		add: smallChild;
		add: mediumChild2;
		add: largeChild;
		add: mediumChild3;
		fullBounds;
		yourself.

	self
		assert: smallChild minSize + (0 @ 0) equals: smallChild extent;
		assert: mediumChild1 minSize + (23 @ 0) equals: mediumChild1 extent;
		assert: mediumChild2 minSize + (23 @ 0) equals: mediumChild2 extent;
		assert: mediumChild3 minSize + (22 @ 0) equals: mediumChild3 extent;
		assert: largeChild minSize + (22 @ 0) equals: largeChild extent