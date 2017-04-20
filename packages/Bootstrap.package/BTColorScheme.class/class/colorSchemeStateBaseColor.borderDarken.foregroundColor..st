private
colorSchemeStateBaseColor: aBaseColorString borderDarken: aNumber foregroundColor: aForegroundColorString

	| baseColor |
	baseColor := Color fromString: aBaseColorString.
	
	^ self fg: (Color fromString: aForegroundColorString) bg: baseColor border: (baseColor adjustBrightness: aNumber)