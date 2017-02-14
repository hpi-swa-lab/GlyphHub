as yet unclassified
drawOn: aCanvas
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: (BTColorScheme secondary: #darker)  
		rounded: {true. true. false. false}
		bordered: {false. false. true. false}