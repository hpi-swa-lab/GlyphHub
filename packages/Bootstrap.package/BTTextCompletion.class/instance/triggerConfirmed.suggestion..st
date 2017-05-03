events
triggerConfirmed: aString suggestion: aBTTextCompletionSuggestion

	| plainString |
	plainString := BTMarkupParser strip: aString.
	(self isValidCompletion: plainString) ifTrue: [
		activeSuggestionIndex ~= 0
			ifTrue: [self useActiveSuggestion]
			ifFalse: [self text: plainString].
		
		suggestionsDropdown delete.
		self triggerEvent: #confirmed withArguments: {self text. aBTTextCompletionSuggestion} ifNotHandled: [^ true]].
	^ false