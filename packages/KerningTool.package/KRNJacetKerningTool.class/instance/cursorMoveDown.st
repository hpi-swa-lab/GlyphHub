event handling
cursorMoveDown
	self cursorMoveToGlyphClosestTo: ((self cursor position x)@(self cursor position y +self cursor height + (self cursor height / 2))).
	self cursorChanged: (targetView submorphIndexOf: cursor).