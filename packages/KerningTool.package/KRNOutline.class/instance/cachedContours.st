as yet unclassified
cachedContours
	cachedContours ifNil: [ self refreshCachedData ].
	^cachedContours