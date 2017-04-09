callbacks
enteringWith: aThreadAndGlyph

	| newThread |
	newThread := aThreadAndGlyph first.
	
	self
		thread: newThread;
		enteredFromGlyph: aThreadAndGlyph second;
		updateTitle: newThread;
		updateGlyphLinks: newThread.
	
	preview thread: newThread.
	
	^ Promise unit: nil