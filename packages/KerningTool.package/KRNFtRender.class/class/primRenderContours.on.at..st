as yet unclassified
primRenderContours: anOutline on: aForm at: aPoint
	<primitive: 'primitiveRenderContours' module: 'KRNFtRenderPlugin'>
	"^self primitiveFailed"
	(BalloonCanvas on: aForm)
		aaLevel: 4;
		transformBy: (MatrixTransform2x3 withOffset: aPoint);
		drawGeneralBezierShape: (anOutline contours collect: [ :contour |
			(contour points collect: [ :p | p first ]) asPointArray ])
		color: Color black
		borderWidth: 0
		borderColor: nil