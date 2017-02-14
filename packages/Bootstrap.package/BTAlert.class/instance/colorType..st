as yet unclassified
colorType: aType
	colorType := aType.
	self submorphsDo: [ :child | child color: ((BTColorScheme type: aType mode: #state) foreground) ]