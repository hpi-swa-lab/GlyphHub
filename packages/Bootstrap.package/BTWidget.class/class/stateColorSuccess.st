as yet unclassified
stateColorSuccess
	| bg |
	bg := Color fromString: '#dff0d8'.
	^{
		#background -> bg.
		#border -> (bg adjustBrightness: -0.07).
		#foreground -> (Color fromString: '#3c763d')
	} as: Dictionary