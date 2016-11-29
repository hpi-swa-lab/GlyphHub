as yet unclassified
mouseMove: anEvent
	self topLeft:  anEvent position - self ref.
	self owner changed