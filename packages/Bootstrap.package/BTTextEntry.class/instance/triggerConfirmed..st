event handling
triggerConfirmed: aString
	" enter or similar was pressed. if any listener is connected to this event,
	  the return event won't put a newline character "
	self triggerEvent: #confirmed with: aString ifNotHandled: [^true].
	^false