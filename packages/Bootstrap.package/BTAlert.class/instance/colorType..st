as yet unclassified
colorType: aType
	colorType := aType.
	self submorphsDo: [ :child | child color: ((BTWidget stateColorFor: aType) at: #foreground) ]