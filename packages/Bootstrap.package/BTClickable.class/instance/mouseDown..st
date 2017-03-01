as yet unclassified
mouseDown: anEvent
	initiateDragOf ifNotNilDo: [ :widget |
		anEvent hand grabMorph: widget ].
	
	do valueWithEnoughArguments: {self. anEvent}