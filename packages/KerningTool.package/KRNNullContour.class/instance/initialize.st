as yet unclassified
initialize
	super initialize.
	self color: Color transparent.
	points := nil.
	closed := false.
	lockLayoutChanged := false