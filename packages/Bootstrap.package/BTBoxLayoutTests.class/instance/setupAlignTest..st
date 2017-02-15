aligning
setupAlignTest: alignModes
	| child topLevel |
	child := BTWidget new minSize: 50 asPoint; align: alignModes.
	topLevel := BTTopLevel new minSize: 100 asPoint; vertical: false; spacing: 0; padding: 0; add: child; fullBounds; yourself.
	
	^{child. topLevel}