event handling
mouseMove: evt
	evt redButtonPressed ifTrue: [ self moveSnappedTo: evt position ]