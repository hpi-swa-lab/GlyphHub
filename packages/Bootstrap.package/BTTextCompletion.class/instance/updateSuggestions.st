suggestions
updateSuggestions
	
	^ suggestionsAsynchronusBlock
		ifNotNil: [
			self suggestionsList: #().
			(suggestionsAsynchronusBlock value: self text) then: [:tuples |
				self suggestionsList: tuples.
				suggestionsList ifNotNil: [self displaySuggestions: suggestionsList].
				self
					updatePreviewTextFor: self text;
					changed]]
		ifNil: [suggestionsList ifNotNil: [
			self displaySuggestions: (suggestionsList select: [:suggestion |
				suggestion first includesSubstring: self text caseSensitive: false])].
			Promise unit: true]