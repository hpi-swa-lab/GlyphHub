initialize-release
initialize
	focused := false.
	disabled := false.
	cursor := 0.
	selectionBound := 0.
	cursorRect := 0 @ 0 extent: 0 @ 0.
	placeholder := ''.
	drawCursor := true.
	
	super initialize