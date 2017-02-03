as yet unclassified
drawBackgroundOn: aCanvas bounds: aRectangle colors: aColorSet
	self drawBackgroundOn: aCanvas bounds: aRectangle colors: aColorSet rounded: {true.true.true.true} bordered: {true.true.true.true}
	"aCanvas
		fillRoundRect: aRectangle radius: BTWidget borderRadius fillStyle: (aColorSet at: #background);
		frameRoundRect: aRectangle radius: BTWidget borderRadius width: 1 color: (aColorSet at: #border)"