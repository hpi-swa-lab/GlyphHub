event handling
handleTypeEnd: aHandleType
	self endPointMorph handleType: aHandleType.
	self controlPoint2Morph handleType: aHandleType.
	
	 self nextSegment ifNotNilDo: [ :segment |
		segment startPointMorph handleType: aHandleType.
		segment controlPoint1Morph handleType: aHandleType ].
	
	self updateHandleTypeOfNextCurve