events
triggerConfirmed: aString

	(self isValidCompletion: aString) ifTrue: [
		activeSuggestionIndex ~= 0
			ifTrue: [self useActiveSuggestion]
			ifFalse: [self text: aString].
		
		suggestionsDropdown delete.
		super triggerConfirmed: self text].

	^ false