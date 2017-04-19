events
triggerConfirmed: aString

	(self isValidCompletion: aString) ifTrue: [
		activeSuggestion ~= 0
			ifTrue: [self useActiveSuggestion]
			ifFalse: [self text: aString].
		
		suggestions delete.
		super triggerConfirmed: self text].

	^ false