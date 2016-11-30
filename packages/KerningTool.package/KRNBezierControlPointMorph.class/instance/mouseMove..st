as yet unclassified
mouseMove: evt
	self topLeft: evt position - ref.
	self bezierMorph changed