as yet unclassified
testPreferredSizeEmpty
	
	| container |
	container := self container.
	
	(self expect: (container preferredSizeForWidth: 400)) to equal: (BTSizeRequest fixed: 0 asPoint).
	
	container minSize: 100 asPoint.
	
	(self expect: (container preferredSizeForWidth: 400)) to equal: (BTSizeRequest fixed: 100 asPoint)