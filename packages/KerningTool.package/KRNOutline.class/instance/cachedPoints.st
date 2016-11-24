as yet unclassified
cachedPoints
	cachedPoints ifNil: [ self refreshCachedData ].
	^cachedPoints