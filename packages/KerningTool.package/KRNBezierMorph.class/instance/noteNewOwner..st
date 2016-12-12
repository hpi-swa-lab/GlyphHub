event handling
noteNewOwner: aMorph
	self nextSegment ifNotNilDo: [ :segment | self handleTypeEnd: segment startPointMorph handleType ].
	self previousSegment ifNotNilDo: [ :segment | self handleTypeStart: segment endPointMorph handleType ]