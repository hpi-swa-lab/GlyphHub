initialize-release
initialize
	super initialize.
	
	minSize := 0 @ 0.
	maxSize := -1 @ -1.
	vertical := false.
	spacing := 0.
	expand := false.
	ignoreLayout := false.
	align := #(fill fill).
	
	self
		color: Color transparent;
		colorScheme: #inherit