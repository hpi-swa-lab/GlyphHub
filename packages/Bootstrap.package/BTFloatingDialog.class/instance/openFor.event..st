as yet unclassified
openFor: aTargetWidget event: anEvent
	self
		position: (self openPositionFor: aTargetWidget);
		openInWorld.

	anEvent hand
		newMouseFocus: self;
		newKeyboardFocus: self