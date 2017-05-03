events
triggerConfirmed: aString suggestion: aBTTextCompletionSuggestion

	| plainString |
	plainString := BTMarkupParser strip: aString.
	self
		closeSuggestionPopup;
		text: plainString;
		triggerEvent: #confirmed withArguments: {aString. aBTTextCompletionSuggestion}