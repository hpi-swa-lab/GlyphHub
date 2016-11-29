as yet unclassified
drawOn: aCanvas at: aPoint color: aColor
	[ self
		refreshCachedData;
		primRenderContours: self on: aCanvas form
		at: aPoint ] on: Error do:
	[ aCanvas asBalloonCanvas preserveStateDuring: [ :canvas |
		canvas
			aaLevel: 4;
			transformBy: (MatrixTransform2x3 withOffset: aPoint);
			drawGeneralBezierShape: self balloonPointsForOutline
			color: aColor
			borderWidth: 0
			borderColor: nil ]]