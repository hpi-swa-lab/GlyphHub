suggestions
useActiveSuggestion
	(topHit isNil and: [activeSuggestion = 0]) ifTrue: [^self].
	
	self text: (activeSuggestion ~= 0
			ifTrue: [(suggestions submorphs at: activeSuggestion) firstSubmorph plainText]
			ifFalse: [topHit first])