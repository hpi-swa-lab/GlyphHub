as yet unclassified
collapsed: aBoolean
	aBoolean == collapsed ifTrue: [^self].
	container hasSubmorphs ifFalse: [^self].
	
	widgetHeight := container firstSubmorph extent y.
	
	endHeight := collapsed ifTrue: [widgetHeight] ifFalse: [0].
	startHeight := collapsed ifTrue: [0] ifFalse: [widgetHeight].
	endTime := Time millisecondClockValue + transitionDuration.
	
	animating := true.
	collapsed := aBoolean.
	self extent: self extent.
	self startStepping: #animate at: Time millisecondClockValue arguments: nil stepTime: 1