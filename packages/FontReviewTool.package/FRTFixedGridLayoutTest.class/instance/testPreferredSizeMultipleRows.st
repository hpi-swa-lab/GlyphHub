as yet unclassified
testPreferredSizeMultipleRows
	
	| container |
	container := self container.
	
	6 timesRepeat: [container add: BTWidget new].
	
	(self expect: (container preferredSizeForWidth: 120)) to
		equal: (BTSizeRequest min: 50 @ (50 * 3) natural: (50 * 2) @ (50 * 3))