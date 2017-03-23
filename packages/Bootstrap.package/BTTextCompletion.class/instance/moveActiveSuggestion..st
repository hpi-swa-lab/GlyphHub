suggestions
moveActiveSuggestion: aDirection
	| suggestionItem suggestionText |
	activeSuggestion ~= 0 ifTrue: [
		(suggestions submorphs at: activeSuggestion) active: false ].
	
	activeSuggestion := activeSuggestion + aDirection clampLow: 0 high: suggestions submorphCount.
	
	activeSuggestion = 0 ifTrue: [
		^self updateText: self text; placeCursorAt: self text size ].
	
	suggestionItem := (suggestions submorphs at: activeSuggestion) active: true.
	suggestionText := suggestionItem firstSubmorph plainText.
	
	self
		internalText: suggestionText;
		placeCursorAt: suggestionText size