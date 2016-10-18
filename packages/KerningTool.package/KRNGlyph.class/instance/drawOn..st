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
		canvas drawGeneralBezierShape: shapes color: self color borderWidth: 5 borderColor: nil.
		
		"(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
			contour elements do: [ :point | | pt |
				pt := (point attributeAt: #x) asNumber @ (point attributeAt: #y) asNumber.
				canvas drawString: (pt asString) in: (pt extent: 200@200) font: ECMenuMorph messageFont color: Color red ]]"]
	