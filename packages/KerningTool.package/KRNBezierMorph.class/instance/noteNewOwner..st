event handling
noteNewOwner: aMorph
	self nextSegment ifNotNilDo: [ :segment | self markEndSmooth: segment startPointMorph smooth ].
	self previousSegment ifNotNilDo: [ :segment | self markStartSmooth: segment endPointMorph smooth ]