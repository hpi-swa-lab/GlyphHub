suggestions
isValidCompletion: aString

	^ activeSuggestion ~= 0 or: 
		[self onlyCompletions not or:
		[suggestionsList anySatisfy: [ :suggestion | suggestion first = aString ]]]