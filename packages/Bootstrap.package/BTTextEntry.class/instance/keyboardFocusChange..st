event handling
keyboardFocusChange: weHaveFocus
	super keyboardFocusChange: weHaveFocus.
	
	focused := weHaveFocus.

	focused
		ifTrue: [ self startBlinking ]
		ifFalse: [ self stopBlinking; clearSelection ].
	
	self updateCursor