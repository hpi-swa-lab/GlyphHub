accessing
drawHelperLineFrom: aPoint to: anotherPoint on: aCanvas
	aCanvas
		line: (self relativePositionOf: aPoint)
		to: (self relativePositionOf: anotherPoint)
		width: 1
		color: Color gray