as yet unclassified
testPreferredSizeEmpty
	
	| container |
	container := self container.
	
	(self expect: (container preferredSizeForWidth: 400)) to equal: {0 asPoint. 0 asPoint}.
	
	container minSize: 100 asPoint.
	
	(self expect: (container preferredSizeForWidth: 400)) to equal: {100 asPoint. 100 asPoint}