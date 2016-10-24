drawing
drawOn: aCanvas
	| shapes shape scale |
	shapes := OrderedCollection new.
	scale := self scale.
	
	aCanvas asBalloonCanvas preserveStateDuring: [ :bcanvas |
		bcanvas transformBy: (MatrixTransform2x3 withOffset: self position).
	
		components do: [ :glyph | glyph drawOn: bcanvas.		self haltOnce. ].
	
		(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
			shape := self pointsForContour: contour.
			shape ifNotEmpty: [ shapes add: shape asPointArray ]].
	
		bcanvas preserveStateDuring: [ :canvas |
			canvas aaLevel: 4.
			canvas transformBy: (MatrixTransform2x3 withOffset: (0 @ self font ascender * scale)).
			canvas transformBy: (MatrixTransform2x3 withScale: scale asPoint * (1 @ -1)).
			canvas transformBy: self transform.
			canvas drawGeneralBezierShape: shapes color: self color borderWidth: 0 borderColor: nil ]]