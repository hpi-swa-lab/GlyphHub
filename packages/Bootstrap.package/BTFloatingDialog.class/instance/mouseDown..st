as yet unclassified
mouseDown: anEvent
	Transcript show: anEvent; cr.
	(self fullContainsPoint: anEvent position) ifFalse: [
		self delete ]