as yet unclassified
drawOn: aCanvas
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: ({
			#background -> BTWidget backgroundColorSecondary.
			#border -> BTWidget borderColor } as: Dictionary)
		rounded: {true. true. false. false}
		bordered: {false. false. true. false}