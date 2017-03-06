as yet unclassified
testDisallowEmptyText
	| completion |
	#(true false) do: [ :onlyCompletions |
		completion := self completionWidget onlyCompletions: onlyCompletions.
		
		(self expect: completion)	 toNot; send: #confirmed.
		
		self
			keyStroke: completion key: Character cr;
			checkSpies ]