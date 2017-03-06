as yet unclassified
isValidCompletion: aString
	^aString notEmpty and:
		[activeSuggestion ~= 0 or: 
		[self onlyCompletions not or:
		[suggestionsList anySatisfy: [ :s | s first = aString ]]]]