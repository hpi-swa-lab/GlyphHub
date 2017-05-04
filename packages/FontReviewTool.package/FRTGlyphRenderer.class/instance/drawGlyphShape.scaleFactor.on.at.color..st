helper-drawing
drawGlyphShape: aCollection scaleFactor: aNumber on: aCanvas at: aPoint color: aColor
	
	aCanvas asBalloonCanvas preserveStateDuring: [:canvas |
		canvas
			aaLevel: 4;
			transformBy: (MatrixTransform2x3 withOffset: aPoint + (0 @ (aNumber * (self fontinfo at: 'ascender'))));
			transformBy: (MatrixTransform2x3 withScale: aNumber * (1 @ -1));
			drawGeneralBezierShape: aCollection color: aColor borderWidth: 0 borderColor: nil]