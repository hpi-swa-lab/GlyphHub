as yet unclassified
stateColorInfo
	| bg |
	bg := Color fromString: '#d9edf7'.
	^{
		#background -> bg.
		#border -> (bg adjustBrightness: -0.05).
		#foreground -> (Color fromString: '#31708f')
	} as: Dictionary