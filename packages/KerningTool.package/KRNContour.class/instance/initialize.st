initialize-release
initialize
	super initialize.
	self color: Color transparent.
	points := OrderedCollection new.
	closed := false