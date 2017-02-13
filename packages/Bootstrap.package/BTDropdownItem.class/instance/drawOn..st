as yet unclassified
drawOn: aCanvas
	(hovered or: [active]) ifTrue: [
		aCanvas fillRectangle: self bounds fillStyle: BTWidget grayLighter ]