as yet unclassified
updateCursor
	cursorRect := (self layout cursorRectAt: self cursor) first.
	selectionBoundRect := (self layout cursorRectAt: self selectionBound) first.
	self changed