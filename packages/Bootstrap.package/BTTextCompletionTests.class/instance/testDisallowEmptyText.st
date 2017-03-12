as yet unclassified
testDisallowEmptyText
	| completion |
	#(true false) do: [ :onlyCompletions |
		completion := self completionWidget onlyCompletions: onlyCompletions.
		
		(self expect: completion)	 to not send: #confirmed.
		
		self
			keyStroke: completion key: Character cr;
			checkSpies ]