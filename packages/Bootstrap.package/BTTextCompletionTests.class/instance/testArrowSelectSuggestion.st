as yet unclassified
testArrowSelectSuggestion
	| completion |
	#(true false) do: [ :onlyCompletions |
		completion := self completionWidget
		text: 'Ger';
		onlyAllowsExactMatches: onlyCompletions.
		(completion updateText: 'Ger') then: [
			self
				keyStroke: completion key: Character arrowDown;
				keyStroke: completion key: Character tab.
			(self expect: completion text) to equal: 'Germany']]