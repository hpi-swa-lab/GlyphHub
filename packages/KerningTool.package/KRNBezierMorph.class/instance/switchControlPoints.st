event handling
switchControlPoints
	| temp |
	temp := self controlPoint1.
	self controlPoint1: self controlPoint2.
	self controlPoint2: temp