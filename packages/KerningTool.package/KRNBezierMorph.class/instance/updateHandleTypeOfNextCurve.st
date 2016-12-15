event handling
updateHandleTypeOfNextCurve
	Transcript show: 'nextCurve'.
	self nextSegment ifNotNil:[
		((self nextSegment startPointMorph handleType) == (self endPointMorph handleType)) ifTrue: [
			"change nothing"]
			ifFalse:[
				self nextSegment handleTypeStart: self endPointMorph handleType  ]]