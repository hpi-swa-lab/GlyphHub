event handling
switchStartEndPoints
	| temp |
	temp := self startPoint.
	self startPoint: self endPoint.
	self endPoint: temp