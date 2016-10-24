as yet unclassified
cursorMove: step
	targetView
		addMorph: cursor
		asElementNumber: ((targetView submorphIndexOf: cursor) + step clampLow: 1 high: targetView submorphCount)