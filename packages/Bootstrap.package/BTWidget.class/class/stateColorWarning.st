as yet unclassified
stateColorWarning
	| bg |
	bg := Color fromString: '#fcf8e3'.
	^{
		#background -> bg.
		#border -> (bg adjustBrightness: -0.05).
		#foreground -> (Color fromString: '#8a6d3b')
	} as: Dictionary