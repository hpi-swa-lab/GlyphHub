drawing
drawHelperLineFrom: aPoint to: anotherPoint on: aCanvas
	aCanvas
		line: aPoint - self position
		to: anotherPoint -  self position
		width: 1
		color: Color lightGray