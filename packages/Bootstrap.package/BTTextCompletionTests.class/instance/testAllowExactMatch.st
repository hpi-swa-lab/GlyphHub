as yet unclassified
testAllowExactMatch
	| completion |
	completion := self completionWidget onlyCompletions: true; text: 'Germany'.
	
	(self expect: completion) to; send: #confirmed withArguments: #('Germany').
	
	self
		keyStroke: completion key: Character cr;
		checkSpies