as yet unclassified
displayFor: aDuration onDismiss: aBlock
	[ (Delay forMilliseconds: aDuration) wait. aBlock valueWithEnoughArguments: {self}. self delete ] fork