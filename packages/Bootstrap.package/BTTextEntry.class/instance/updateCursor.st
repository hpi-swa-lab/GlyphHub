as yet unclassified
updateCursor
	| data |
	data := self primLayout: layout cursorPos: cursor.
	cursorRect := data first extent: data second.
	self changed