as yet unclassified
keyStroke: anEvent
	| key |
	key := anEvent keyString.
	(key = '<tab>' and: [topHit notNil or: [activeSuggestion ~= 0]]) ifTrue: [ ^self confirmCompletion ].
	(key = '<down>') ifTrue: [ ^self moveActiveSuggestion: 1 ].
	(key = '<up>') ifTrue: [ ^self moveActiveSuggestion: -1 ].
	(key = '<cr>') ifTrue: [ self confirmCompletion ].
	
	super keyStroke: anEvent