event handling
dragAndDrop: anEvent

	(anEvent startPoint y < anEvent endPoint y)
		"This should scroll a bit faster than the mouse wheel"
		ifTrue: [self scrollOffset: self scrollOffset + (0 @ self class scrollSpeed * 2)]
		ifFalse: [self scrollOffset: self scrollOffset - (0 @ self class scrollSpeed * 2)]