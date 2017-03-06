as yet unclassified
testDisallowFreeText
	| completion |
	completion := self completionWidget onlyCompletions: true; text: 'My Custom Value'.
	
	(self expect: completion)	 toNot; send: #confirmed.
	
	self
		keyStroke: completion key: Character cr;
		checkSpies