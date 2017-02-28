as yet unclassified
mouseLeave: anEvent
	self hoveredDo ifNotNil: [ hoveredDo valueWithEnoughArguments: {false. self. anEvent} ].
	self hovered: false.
	self changed