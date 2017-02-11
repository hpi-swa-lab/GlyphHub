as yet unclassified
colorType: aType
	colorType := aType.

	self hasSubmorphs ifTrue: [
		self firstSubmorph color: ((BTWidget colorsForType: colorType) at: #foreground) ]