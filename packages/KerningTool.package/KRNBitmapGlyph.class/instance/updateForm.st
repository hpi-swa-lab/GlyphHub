as yet unclassified
updateForm
	self changed.
	form := originalForm copy rotateBy: transform angle magnify: self formScale smoothing: 3.
	super extent: self preferredExtent