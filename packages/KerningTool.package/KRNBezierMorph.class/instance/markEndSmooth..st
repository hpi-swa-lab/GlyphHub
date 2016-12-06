event handling
markEndSmooth: aBoolean
	self endPointMorph smooth: aBoolean.
	self controlPoint2Morph smooth: aBoolean.
	
	 self nextSegment ifNotNilDo: [ :segment |
		segment startPointMorph smooth: aBoolean.
		segment controlPoint1Morph smooth: aBoolean ]