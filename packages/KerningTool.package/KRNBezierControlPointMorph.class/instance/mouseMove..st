as yet unclassified
mouseMove: evt
	| delta |
	delta := evt position - ref.
	self center: self center + delta.
	ref := evt position.
	self changed: #pointMoved with: delta