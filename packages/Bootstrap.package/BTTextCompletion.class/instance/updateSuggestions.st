suggestions
updateSuggestions
	
	"suggestionsAsynchronusBlock ifNotNil: [
		suggestionsList := self value: suggestionsAsynchronusBlock]."
	suggestionsList ifNotNil: [
		self displaySuggestions: (suggestionsList select: [:suggestion |
			suggestion first includesSubstring: self text caseSensitive: false])].
	
	
	" TODO test for suggestionsPromise "