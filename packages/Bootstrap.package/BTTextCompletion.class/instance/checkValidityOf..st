suggestions
checkValidityOf: aSuggestion

	^ (aSuggestion isString) or: [aSuggestion isTextCompletionSuggestion]