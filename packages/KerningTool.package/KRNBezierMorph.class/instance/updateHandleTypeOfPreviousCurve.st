event handling
updateHandleTypeOfPreviousCurve
	self previousSegment ifNotNil:[
		((self previousSegment endPointMorph handleType) == (self startPointMorph handleType)) ifTrue: [
			"change nothing"]
			ifFalse:[
				self previousSegment handleTypeEnd: self startPointMorph handleType  ]]