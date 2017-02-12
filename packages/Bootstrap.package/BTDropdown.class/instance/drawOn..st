as yet unclassified
drawOn: aCanvas
	BTWidget drawBackgroundOn: aCanvas bounds: self bounds colors: ({
		#background -> BTWidget backgroundColor.
		#border -> (BTWidget grayLight)
	} as: Dictionary)