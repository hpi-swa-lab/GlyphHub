selection
selectionBound: aNumber
	selectionBound := aNumber clampLow: 0 high: self text size.

	self updateCursor