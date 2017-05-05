styling
keyStroke: anEvent

	| key |
	key := anEvent keyString.
	((key = '<backspace>' or: [key = '<delete>']) and: [self text isEmpty]) ifTrue: [self triggerEvent: #removed].

	super keyStroke: anEvent