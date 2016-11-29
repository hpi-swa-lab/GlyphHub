drawing
drawOn: aCanvas at: aPoint color: aColor

	aCanvas asBalloonCanvas transformBy: (MatrixTransform2x3 withOffset: self position) during: [ :canvas |  
		self outline drawOn: canvas at: (0 @ self font ascender * self scale) floor color: aColor.
	
		components do: [ :glyph | glyph drawOn: canvas at: aPoint + glyph transform offset color: aColor ]]