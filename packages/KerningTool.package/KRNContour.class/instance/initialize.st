initialize-release
initialize
	super initialize.
	self color: Color black.
	points := OrderedCollection new.
	closed := false.
	lockLayoutChanged := false