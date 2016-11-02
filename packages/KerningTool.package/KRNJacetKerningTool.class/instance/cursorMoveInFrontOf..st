event handling
cursorMoveInFrontOf: aMorph
	targetView addMorph: cursor inFrontOf: aMorph.
	self cursorChanged: (targetView submorphIndexOf: cursor).