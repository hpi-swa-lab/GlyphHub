drawing
smoothControlPoints
	| previous offset |
	previous := self submorphBefore.
	offset := previous endPoint - previous controlPoint2.
	self controlPoint1: offset + previous endPoint.
	self controlPoint2: offset + self endPoint