as yet unclassified
initialize
	container := TransformMorph new
		color: Color transparent;
		yourself.
	
	super initialize.

	transitionDuration := 200.
	animating := false.
	collapsed := false.
	
	self addMorph: container; hResizing: #spaceFill; vResizing: #spaceFill