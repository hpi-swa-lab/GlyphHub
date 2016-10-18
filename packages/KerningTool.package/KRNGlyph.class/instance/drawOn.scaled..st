drawing
drawOn: aCanvas scaled: aNumber
	| shapes shape |
	shapes := OrderedCollection new.
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
		shape := self pointsForContour: contour.
		shape ifNotEmpty: [ shapes add: shape asPointArray ]].
	
	aCanvas asBalloonCanvas preserveStateDuring: [ :canvas |
		canvas aaLevel: 4.
		canvas transformBy: (MatrixTransform2x3 withOffset: self position + (0 @ self advance y)).
		canvas transformBy: (MatrixTransform2x3 withScale: aNumber asPoint * (1 @ -1)).
		canvas drawGeneralBezierShape: shapes color: Color white borderWidth: 5 borderColor: Color gray
	]
	