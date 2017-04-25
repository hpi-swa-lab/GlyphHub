suggestions
moveActiveSuggestion: aDirection

	activeSuggestionIndex ~= 0 ifTrue: [
		(suggestionsDropdown submorphs at: activeSuggestionIndex) active: false].
	
	activeSuggestionIndex := activeSuggestionIndex + aDirection clampLow: 0 high: suggestionsDropdown submorphCount.
	
	self
		updatePreviewTextFor: self text;
		changed.
	
	activeSuggestionIndex = 0
		ifTrue: [^ self updatePreviewTextFor: self text; placeCursorAt: self text size].
	
	(suggestionsDropdown submorphs at: activeSuggestionIndex) active: true