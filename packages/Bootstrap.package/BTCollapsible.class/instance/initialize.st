as yet unclassified
initialize
	container := TransformMorph new
		color: Color transparent;
		yourself.
	
	transitionDuration := 250.
	animating := false.
	collapsed := false.
	
	super initialize.
	
	self
		addMorph: container;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap