bugs
testExpandingInExpandingWithAnotherChild
	| inner outer child sizeAssertions topLevel |
	inner := BTWidget new withLayout; align: #(fill start); expand: true.
	child := BTWidget new color: Color red; minSize: 30.
	outer := BTWidget new
		withLayout;
		align: #(fill start);
		expand: true;
		add: child;
		add: inner.

	topLevel := BTTopLevel new size: 600 asPoint; padding: 0; add: outer; fullBounds.
	
	sizeAssertions := [
		self
			assert: 30 asPoint equals: child extent;
			assert: 600 @ 30 equals: outer extent;
			assert: 600 @ 30 equals: topLevel extent;
			assert: 570 @ 0 equals: inner extent ].
	
	sizeAssertions value.
	
	topLevel layoutChanged; fullBounds.
	sizeAssertions value