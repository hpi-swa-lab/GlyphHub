preferred-size
testPreferredSizeOfExpanding
	| inner outer child topLevel size |
	inner := self horizontalContainer expand: true.
	child := self widget minSize: 30.
	outer := self horizontalContainer
		expand: true;
		add: child;
		add: inner.
	
	topLevel := self horizontalTopLevel add: outer; fullBounds; yourself.
	
	size := inner preferredSizeForWidth: 600.
	self
		assert: 0 @ 0 equals: size first;
		assert: 600 @ 0 equals: size second