initialize-release
withForeground: aForegroundColor background: aBackgroundColor border: aBorderColor

	^ self new
		privateForeground: aForegroundColor;
		privateBackground: aBackgroundColor;
		privateBorder: aBorderColor;
		yourself