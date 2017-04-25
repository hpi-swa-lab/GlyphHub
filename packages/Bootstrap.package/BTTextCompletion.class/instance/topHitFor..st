suggestions
topHitFor: aString

	^ activeSuggestionIndex ~= 0
		ifTrue: [self suggestionsDropdown plainTextForItemAt: activeSuggestionIndex]
		ifFalse: [ | firstItemText |
			self suggestionsDropdown hasSubmorphs
				ifTrue: [
					firstItemText := self suggestionsDropdown plainTextForItemAt: 1.
					(firstItemText findString: aString startingAt: 1 caseSensitive: false) = 1 
						ifTrue: [firstItemText]
						ifFalse: [aString]]
				ifFalse: [aString]]