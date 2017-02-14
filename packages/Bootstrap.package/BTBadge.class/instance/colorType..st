as yet unclassified
colorType: aType
	colorType := aType.

	self hasSubmorphs ifTrue: [
		self firstSubmorph color: (BTColorScheme type: colorType mode: #invert) foreground ]