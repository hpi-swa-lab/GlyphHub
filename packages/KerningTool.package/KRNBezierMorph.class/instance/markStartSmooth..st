event handling
markStartSmooth: aBoolean
	self startPointMorph smooth: aBoolean.
	self controlPoint1Morph smooth: aBoolean.

	 self previousSegment ifNotNilDo: [ :segment |
		segment endPointMorph smooth: aBoolean.
		segment controlPoint2Morph smooth: aBoolean ]