as yet unclassified
colorType: aColorType
	" convenience method to set the color type of all child buttons. will be applied to new buttons, too "
	colorType := aColorType.
	self submorphsDo: [ :button | button colorType: aColorType ]