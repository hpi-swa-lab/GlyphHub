as yet unclassified
mouseDown: anEvent
	(self fullContainsPoint: anEvent position) ifFalse: [ self delete ]