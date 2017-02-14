cursor
cursor: aNumber
	cursor := aNumber clampLow: 0 high: self text size.

	self
		updateCursor;
		resetBlinkCursor