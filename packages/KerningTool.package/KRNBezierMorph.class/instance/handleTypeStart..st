event handling
handleTypeStart: aHandleType  
	self startPointMorph handleType: aHandleType.
	self controlPoint1Morph handleType: aHandleType.

	 self previousSegment ifNotNilDo: [ :segment |
		segment endPointMorph handleType: aHandleType.
		segment controlPoint2Morph handleType: aHandleType ].
	
	self updateHandleTypeOfPreviousCurve