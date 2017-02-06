as yet unclassified
drawOn: aCanvas
	BTWidget
		drawCircularBackgroundOn: aCanvas
		bounds: self bounds
		colors: ({
			#background -> (hovered
				ifTrue: [Color fromString: '#333333']
				ifFalse: [Color fromString: '#555555']).
			#border -> nil } as: Dictionary)