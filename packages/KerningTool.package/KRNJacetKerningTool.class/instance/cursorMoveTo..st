event handling
cursorMoveTo: aPosition

	| cursorIndex |
	cursorIndex := aPosition clampLow: 1 high: targetView submorphCount.
	targetView
		addMorph: cursor
		asElementNumber: cursorIndex.
	self cursorChanged: cursorIndex.