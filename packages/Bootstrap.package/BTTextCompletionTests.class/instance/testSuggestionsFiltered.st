as yet unclassified
testSuggestionsFiltered
	| completion displayed |
	completion := self completionWidget text: 'an'.
	displayed := self displayedSuggestions.
	
	(self expect: displayed) to not contain: #('Austria' 'Australia' 'Argentina').
	
	(self expect: displayed) to containExactly: #('Andorra' 'Germany' 'France'  'Albania')