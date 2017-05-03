as yet unclassified
testSuggestionsFiltered
	| completion displayed |
	completion := self completionWidget openInWorld; text: 'an'; yourself.
	(completion updateText: 'an') then: [
		displayed := self displayedSuggestions.
	
		(self expect: displayed) to not contain: #('Austria' 'Australia' 'Argentina').

		(self expect: displayed) to containExactly: #('Andorra' 'Germany' 'France'  'Albania')]