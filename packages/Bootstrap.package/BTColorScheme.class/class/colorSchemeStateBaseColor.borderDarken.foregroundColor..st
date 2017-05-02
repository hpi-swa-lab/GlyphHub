private
colorSchemeStateBaseColor: aBaseColorString borderDarken: aNumber foregroundColor: aForegroundColorString

	| baseColor |
	baseColor := Color fromString: aBaseColorString.
	
	^ self
		withForeground: (Color fromString: aForegroundColorString)
		background: baseColor
		border: (baseColor adjustBrightness: aNumber)