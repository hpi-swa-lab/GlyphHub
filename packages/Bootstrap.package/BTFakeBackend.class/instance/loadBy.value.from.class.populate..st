as yet unclassified
loadBy: aSelector value: aValue from: aString class: aClass populate: aCollection
	| models |
	models := ((tables at: aString)
		select: [ :e | (e at: aSelector asString ifAbsent: [nil]) = aValue ])
		collect: [ :e | self deserialize: e class: aClass ].
	
	self join: models class: aClass populate: aCollection.
	
	^Promise unit: models