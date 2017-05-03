initialize-release
initialize

	super initialize.
	
	policy := #(show scroll).
	
	container := TransformMorph new
		color: Color transparent;
		yourself.
	
	scrollBars := {BTScrollBar scrollArea: self. BTScrollBar scrollArea: self}.
	
	self
		inStickyMode: true;
		addMorph: container;
		addMorph: scrollBars first;
		addMorph: scrollBars second