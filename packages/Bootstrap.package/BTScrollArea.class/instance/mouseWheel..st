event handling
mouseWheel: anEvent
	anEvent isWheelUp ifTrue: [ self scrollOffset: self scrollOffset - (0 @ self class scrollSpeed) ].
	anEvent isWheelDown ifTrue: [ self scrollOffset: self scrollOffset + (0 @ self class scrollSpeed) ]