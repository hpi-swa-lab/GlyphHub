as yet unclassified
collapsed: aBoolean
	| widgetHeight |
	aBoolean = collapsed ifTrue: [^self].
	
	collapsed := aBoolean.
	
	container hasSubmorphs ifFalse: [^self].
	widgetHeight := container firstSubmorph extent y.
	
	endHeight := collapsed ifTrue: [widgetHeight] ifFalse: [0].
	startHeight := collapsed ifTrue: [0] ifFalse: [widgetHeight].
	
	endTime := Time millisecondClockValue + 200.
	animating := true.
	self startStepping: #animate at: Time millisecondClockValue arguments: nil stepTime: 1