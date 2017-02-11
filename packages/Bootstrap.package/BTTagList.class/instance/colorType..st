as yet unclassified
colorType: aColorType
	colorType := aColorType.
	self submorphsDo: [ :badge | badge colorType: aColorType ]