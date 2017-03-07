event handling
mouseDown: anEvent
	initiateDragOf ifNotNilDo: [ :widget |
		anEvent hand grabMorph: widget ].
	
	hadMouseDown := true