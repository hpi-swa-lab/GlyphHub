as yet unclassified
initialize
	super initialize.

	transitionDuration := 200.
	animating := false.
	collapsed := false.
	container := TransformMorph new
		color: Color transparent;
		yourself.
	
	self addMorph: container