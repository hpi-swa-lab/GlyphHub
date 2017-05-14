as yet unclassified
drawOn: aCanvas

	aCanvas asBalloonCanvas preserveStateDuring: [:canvas |
		canvas
			aaLevel: 4;
			transformBy:  (MatrixTransform2x3 withOffset: self position);
			drawGeneralBezierShape: self createBezierShape 
				color: nil
				borderWidth: 1
				borderColor: self color;
				yourself.
		
		self
			drawHandleLineFrom: startPointMorph center to: controlPoint1Morph center on: canvas;
			drawHandleLineFrom: endPointMorph center to: controlPoint2Morph center on: canvas]