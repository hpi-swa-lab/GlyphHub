as yet unclassified
drawOn: aCanvas
	hovered ifTrue: [
		aCanvas fillRectangle: self bounds fillStyle: BTWidget grayLighter ]