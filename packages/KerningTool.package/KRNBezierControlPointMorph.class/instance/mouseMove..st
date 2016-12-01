as yet unclassified
mouseMove: evt
	self center: evt position - ref.
	self bezierMorph changed