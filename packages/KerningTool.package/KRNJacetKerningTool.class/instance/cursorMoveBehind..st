as yet unclassified
cursorMoveBehind: aMorph
	targetView addMorph: cursor behind: aMorph.
	self cursorChanged: (targetView submorphIndexOf: cursor).