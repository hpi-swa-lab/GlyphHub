suggestions
updateSuggestions
	
	suggestionsAsynchronusBlock
		ifNotNil: [
			self suggestionsList: #().
			(suggestionsAsynchronusBlock value: self text) then: [:tupels |
				self suggestionsList: tupels.
				suggestionsList ifNotNil: [self displaySuggestions: suggestionsList]]]
		ifNil: [suggestionsList ifNotNil: [
			self displaySuggestions: (suggestionsList select: [:suggestion |
				suggestion first includesSubstring: self text caseSensitive: false])]]