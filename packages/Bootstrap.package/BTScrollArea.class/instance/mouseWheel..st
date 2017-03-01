as yet unclassified
mouseWheel: anEvent
	anEvent isWheelUp ifTrue: [ container offset: container offset + 10 ].
	anEvent isWheelDown ifTrue: [ container offset: container offset - 10 ]