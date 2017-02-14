as yet unclassified
addedMorph: aButton
	colorType ifNotNil: [
		aButton color: ((BTColorScheme type: colorType mode: #state) foreground) ]