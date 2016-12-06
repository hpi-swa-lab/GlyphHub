event handling
mouseMove: evt
	| delta |
	evt redButtonPressed ifTrue: [
		delta := evt position - ref.
		self center: self center + delta.
		ref := evt position.
		self changed: #pointMoved with: {self. delta} ]