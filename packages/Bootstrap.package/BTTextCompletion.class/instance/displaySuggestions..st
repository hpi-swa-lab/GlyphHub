suggestions
displaySuggestions: aCollection

	suggestionsDropdown removeAllMorphs.
	activeSuggestionIndex := 0.
	
	(aCollection isEmpty or: [self hasMouseFocus not])
		ifTrue: [self closeSuggestionPopup. ^ self]
		ifFalse: [self openSuggestionPopup].

	aCollection do: [:suggestion | | suggestionString |
		suggestionString := (self markupForResult: suggestion).
		suggestionsDropdown add: ((BTDropdownItem
			label: suggestionString)
			when: #clicked send: #triggerConfirmed: to: self with: suggestion)]