as yet unclassified
testTabSelectSuggestion
	| completion |
	completion := self completionWidget text: 'Ger'.
	
	(self expect: completion) to; send: #confirmed withArguments: #('Germany').
	
	self
		keyStroke: completion key: Character tab;
		keyStroke: completion key: Character cr;
		checkSpies