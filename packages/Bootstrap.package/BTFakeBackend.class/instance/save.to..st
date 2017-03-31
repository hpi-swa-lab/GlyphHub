as yet unclassified
save: aModel to: aString
	aModel id = 0
		ifTrue: [
			aModel privateId: idCounter.
			idCounter := idCounter + 1.
			(tables at: aString) add: (self serialize: aModel) ]
		ifFalse: [
			(tables at: aString)
				removeAllSuchThat: [ :entity | (entity at: 'id') ~= aModel id ];
				add: (self serialize: aModel) ].
	
	^BTPromise unit: aModel