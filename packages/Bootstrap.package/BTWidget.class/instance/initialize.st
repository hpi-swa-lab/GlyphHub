initialize-release
initialize
	super initialize.
	
	minSize := 0 @ 0.
	vertical := false.
	spacing := 0.
	align := #(start start).
	
	self
		color: Color transparent;
		colorScheme: #inherit