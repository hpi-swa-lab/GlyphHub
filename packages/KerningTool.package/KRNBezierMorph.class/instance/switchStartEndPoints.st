event handling
switchStartEndPoints
	| temp tempHandleType |
	"self halt."
	temp := self startPoint.
	tempHandleType := self startPointMorph handleType.
	self startPoint: self endPoint.
	self handleTypeStart: self endPointMorph handleType.  
	self endPoint: temp.
	self handleTypeEnd: tempHandleType