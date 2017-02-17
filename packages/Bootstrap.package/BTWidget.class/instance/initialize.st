initialize-release
initialize
	super initialize.
	
	minSize := 0 @ 0.
	maxSize := -1 @ -1.
	vertical := false.
	spacing := 0.
	expand := false.
	ignoreLayout := false.
	align := #(start start).
	
	self
		color: Color transparent;
		colorScheme: #inherit