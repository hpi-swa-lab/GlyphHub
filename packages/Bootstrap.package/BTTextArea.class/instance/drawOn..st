as yet unclassified
drawOn: aCanvas
	super drawOn: aCanvas.
	  
	BTWidget
		drawBackgroundOn: aCanvas
		bounds: self bounds
		colors: ({
			#background -> Color white.
			#border -> (focused
				ifTrue: [BTWidget colorPrimary adjustBrightness: 0.25]
				ifFalse: [Color black alpha: 0.15])} as: Dictionary).  