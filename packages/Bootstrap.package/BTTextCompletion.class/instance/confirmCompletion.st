as yet unclassified
confirmCompletion
	 self selected: (activeSuggestion ~= 0
			ifTrue: [(suggestions submorphs at: activeSuggestion) firstSubmorph plainText]
			ifFalse: [topHit first]) 