drawing
drawOn: aCanvas
	aCanvas asBalloonCanvas preserveStateDuring: [ :canvas |
		canvas
			aaLevel: 4;
			transformBy:  (MatrixTransform2x3 withOffset: self position);
			drawGeneralBezierShape: self createBezierShape 
				color: nil
				borderWidth: 1
				borderColor: self color;
				yourself.
			
		self
			drawHelperLineFrom: self startPoint to: self controlPoint1 on: canvas;
			drawHelperLineFrom: self endPoint to: self controlPoint2 on: canvas ]