as yet unclassified
testPreferredSizeOneChild
	
	| container |
	container := self container
		add: BTWidget new.
		
	(self expect: (container preferredSizeForWidth: 200)) to equal: (BTSizeRequest fixed: 50 asPoint)