as yet unclassified
stateColorDanger
	| bg |
	bg := Color fromString: '#f2dede'.
	^{
		#background -> bg.
		#border -> (bg adjustBrightness: -0.05).
		#foreground -> (Color fromString: '#a94442')
	} as: Dictionary