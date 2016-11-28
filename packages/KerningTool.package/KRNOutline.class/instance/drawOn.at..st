as yet unclassified
drawOn: aCanvas at: aPoint
	self
		refreshCachedData;
		primRenderContours: self on: aCanvas form at: aPoint.
	"[ self
		refreshCachedData;
		primRenderContours: self on: aCanvas form at: aPoint ] on: Error do:
	[ aCanvas asBalloonCanvas
		drawGeneralBezierShape: self balloonPointsForContour
		color: Color black
		borderWidth: 0
		borderColor: nil ]"