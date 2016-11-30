as yet unclassified
drawOn: aCanvas at: aPoint color: aColor
	[ self
		refreshCachedData;
		primRenderContours: self on: aCanvas form
		at: aPoint
		red: aColor red
		green: aColor green
		blue: aColor blue
		alpha: aColor alpha ] on: Error do:
	[ aCanvas asBalloonCanvas preserveStateDuring: [ :canvas |
		canvas
			aaLevel: 4;
			transformBy: (MatrixTransform2x3 withOffset: aPoint);
			" convert from 26.6 pixels to real pixels "
			transformBy: (MatrixTransform2x3 withScale: (1 / 64.0) @ (1 / -64.0));
			drawGeneralBezierShape: self balloonPointsForOutline
			color: aColor
			borderWidth: 0
			borderColor: nil ]] value