suggestions
updateSuggestions
	
	^ suggestionsAsynchronusBlock
		ifNotNil: [
			(suggestionsAsynchronusBlock value: self text) then: [:suggestedStrings |
				self
					suggestionsList: suggestedStrings;
					displaySuggestions: self suggestionsList;
					updatePreviewTextFor: self text;
					changed]]
		ifNil: [self suggestionsList ifNotEmpty: [
			self displaySuggestions: (self suggestionsList select: [:suggestion |
				(suggestion includesSubstring: self text caseSensitive: false) and: [suggestion asLowercase ~= self text asLowercase]])].
			Promise unit: true]