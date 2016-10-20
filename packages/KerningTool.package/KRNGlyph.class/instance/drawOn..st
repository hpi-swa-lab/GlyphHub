drawing
drawOn: aCanvas
	| shapes shape scale |
	shapes := OrderedCollection new.
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
		shape := self pointsForContour: contour.
		shape ifNotEmpty: [ shapes add: shape asPointArray ]].
	
	scale := self scale.
	
	aCanvas asBalloonCanvas preserveStateDuring: [ :canvas |
		canvas aaLevel: 4.
		canvas transformBy: (MatrixTransform2x3 withOffset: self position + (0 @ self font ascender * scale)).
		canvas transformBy: (MatrixTransform2x3 withScale: scale asPoint * (1 @ -1)).
		canvas drawGeneralBezierShape: shapes color: self color borderWidth: 0 borderColor: nil ]