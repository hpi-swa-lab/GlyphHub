as yet unclassified
initialize
	super initialize.
	
	policy := #(show scroll).
	
	container := TransformMorph new
		color: Color transparent;
		yourself.
	
	self addMorph: container