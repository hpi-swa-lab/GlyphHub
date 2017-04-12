event handling
dragAndDrop: anEvent

	self isInStickyMode
		ifTrue: [self scrollOffset: ((self relativeCoordinates: (anEvent endPoint)) * self contentHeight)]
		ifFalse: [(anEvent startPoint y < anEvent endPoint y)
			"This should scroll a bit faster than the mouse wheel"
			ifTrue: [self scrollOffset: self scrollOffset + (0 @ self class scrollSpeed * 2)]
			ifFalse: [self scrollOffset: self scrollOffset - (0 @ self class scrollSpeed * 2)]]