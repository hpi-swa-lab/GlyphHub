suggestions
useActiveSuggestion

	(topHit isNil and: [activeSuggestionIndex = 0]) ifTrue: [^ self].

	self text: (activeSuggestionIndex ~= 0
			ifTrue: [(suggestionsDropdown submorphs at: activeSuggestionIndex) label plainText]
			ifFalse: [topHit first])