displaying
openFor: aTargetWidget event: anEvent

	self
		position: (self openPositionFor: aTargetWidget);
		openInWorld.

	anEvent ifNotNilDo: [:event |
		event hand
			newMouseFocus: self;
			newKeyboardFocus: self]