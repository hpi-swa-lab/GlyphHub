events
keyStroke: aWidget key: aCharacter modifiers: aCollectionOfButtons
	self
		simulateKeyEvent: #keystroke
		key: aCharacter
		buttons: aCollectionOfButtons
		morph: aWidget