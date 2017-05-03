suggestions
updateSuggestions
	
	^ suggestionsAsynchronusBlock
		ifNotNil: [
			(suggestionsAsynchronusBlock value: self text) then: [:suggestions |
				self
					suggestionsList: suggestions;
					displaySuggestions: self suggestionsList;
					updatePreviewTextFor: self text;
					changed]]
		ifNil: [
			self suggestionsList ifNotEmpty: [
				self displaySuggestions: (self suggestionsList select: [:suggestion |
					(suggestion plainText includesSubstring: self text caseSensitive: false) and: [suggestion plainText asLowercase ~= self text asLowercase]])].
				Promise unit: true]