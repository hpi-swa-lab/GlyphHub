as yet unclassified
drawOn: aCanvas
	aCanvas fillRectangle: self innerBounds fillStyle: Color green.
	aCanvas paragraph: self paragraph bounds: self innerBounds color: Color red