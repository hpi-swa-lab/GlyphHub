accessing
leaving

	self gridWidget removeAllMorphs.
	self threadsContainer removeAllMorphs.
	self topLevel sidebar selectedFamily: nil.
	
	^ super leaving