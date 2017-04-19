suggestions
isValidCompletion: aString

	^ activeSuggestion ~= 0 or: 
	[self onlyCompletions not or:
	[suggestionsList anySatisfy: [ :s | s first = aString ]]]