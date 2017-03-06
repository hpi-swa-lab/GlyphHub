as yet unclassified
testArrowSelectSuggestion
	| completion |
	#(true false) do: [ :onlyCompletions |
		completion := self completionWidget text: 'Ger'; onlyCompletions: onlyCompletions.
		
		(self expect: completion) to; send: #confirmed withArguments: #('Germany').
		
		self
			keyStroke: completion key: Character arrowDown;
			keyStroke: completion key: Character cr;
			checkSpies ]