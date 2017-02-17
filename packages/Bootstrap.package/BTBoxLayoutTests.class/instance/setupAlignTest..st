aligning
setupAlignTest: alignModes
	| child topLevel |
	child := self widget minSize: 50 asPoint; align: alignModes.
	topLevel := self horizontalTopLevel minSize: 100 asPoint; add: child; fullBounds; yourself.
	
	^{child. topLevel}