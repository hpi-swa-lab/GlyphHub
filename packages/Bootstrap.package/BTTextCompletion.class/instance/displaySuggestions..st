suggestions
displaySuggestions: aCollectionOfSuggestions

	suggestionsDropdown removeAllMorphs.
	activeSuggestionIndex := 0.
	
	(aCollectionOfSuggestions isEmpty or: [self hasKeyboardFocus not])
		ifTrue: [self closeSuggestionPopup. ^ self]
		ifFalse: [self openSuggestionPopup].

	aCollectionOfSuggestions do: [:suggestion | | suggestionString |
		suggestionString := (self markupForResult: suggestion plainText).
		suggestion label text: suggestionString.
		suggestionsDropdown add: (suggestion
			when: #clicked send: #triggerConfirmed:suggestion: to: self withArguments: {suggestion label text. suggestion};
			yourself)]