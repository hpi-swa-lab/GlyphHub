initialize-release
initialize
	super initialize.
	
	policy := #(show scroll).
	
	container := TransformMorph new
		color: Color transparent;
		yourself.
	
	scrollBars := {BTScrollBar new. BTScrollBar new}.
	
	self
		addMorph: container;
		addMorph: scrollBars first;
		addMorph: scrollBars second