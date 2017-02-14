as yet unclassified
drawOn: aCanvas
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: self colorScheme
		rounded: {true. true. false. false}
		bordered: {false. false. true. false}