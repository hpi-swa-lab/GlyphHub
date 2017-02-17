distributing-space
testDistributingFillExpanderFirst
	| topLevel child1 child2 |
	child1 := self widget expand: true; minSize: 10 asPoint; maxSize: 300 asPoint.
	child2 := self widget minSize: 10 asPoint; maxSize: 20 asPoint.
	
	topLevel := self horizontalTopLevel
		size: 200 @ 10;
		add: child1;
		add: child2;
		fullBounds;
		yourself.

	self
		assert: 190 @ 10 equals: child1;
		assert:  10 @ 10 equals: child2;
		assert: 200 @ 10 equals: topLevel