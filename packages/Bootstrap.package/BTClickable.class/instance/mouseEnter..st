as yet unclassified
mouseEnter: anEvent
	self hoveredDo ifNotNil: [ hoveredDo valueWithEnoughArguments: {true. self. anEvent} ].
	self hovered: true.
	self changed