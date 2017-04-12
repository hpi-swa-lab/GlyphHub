as yet unclassified
testPreferredSizeMultipleRows
	
	| container |
	container := self container.
	
	6 timesRepeat: [container add: BTWidget new].
	
	(self expect: (container preferredSizeForWidth: 120)) to equal: {50 @ (50 * 3). (50 * 2) @ (50 * 3)}