as yet unclassified
addedMorph: aButton
	colorType ifNotNil: [
		aButton color: ((BTWidget stateColorFor: colorType) at: #foreground) ]