as yet unclassified
animate
	| progress height |
	progress := 1.0 - (endTime - Time millisecondClockValue / transitionDuration).
	height := (startHeight interpolateTo: endHeight at: progress).
	progress >= 1.0
		ifTrue: [ animating := false. self extent: self extent ]
		ifFalse: [
			container offset: 0 @ height.
			self extent: 0 @ height ]