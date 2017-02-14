initialize-release
fg: aForegroundColor bg: aBackgroundColor border: aBorderColor
	^self new
		privateForeground: aForegroundColor;
		privateBackground: aBackgroundColor;
		privateBorder: aBorderColor;
		yourself