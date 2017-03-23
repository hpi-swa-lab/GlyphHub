accessing
collapsed: aBoolean
	aBoolean == collapsed ifTrue: [^self].
	collapsed := aBoolean.
	container hasSubmorphs ifFalse: [^self].
	
	widgetHeight := (container firstSubmorph preferredSizeForWidth: self width) first y + self paddingAsPoint y.
	
	endHeight := collapsed ifFalse: [widgetHeight] ifTrue: [0].
	startHeight := collapsed ifFalse: [0] ifTrue: [widgetHeight].
	endTime := Time millisecondClockValue + transitionDuration.
	
	animating := true.
	self layoutChanged.
	self startStepping: #animate at: Time millisecondClockValue arguments: nil stepTime: 1