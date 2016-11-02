event handling
cursorMove: step

	| cursorIndex |
	cursorIndex :=(targetView submorphIndexOf: cursor)+ step clampLow: 1 high: targetView submorphCount.
	targetView
		addMorph: cursor
		asElementNumber: cursorIndex.
	self cursorChanged: cursorIndex.