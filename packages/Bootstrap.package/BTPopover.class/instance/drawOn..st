as yet unclassified
drawOn: aCanvas
	"aCanvas fillRectangle: self bounds fillStyle: Color red "
	BTWidget drawBackgroundWithTipOn: aCanvas bounds: self bounds colors: ({
		#background -> BTWidget backgroundColor.
		#border -> (BTWidget grayLight)
	} as: Dictionary)