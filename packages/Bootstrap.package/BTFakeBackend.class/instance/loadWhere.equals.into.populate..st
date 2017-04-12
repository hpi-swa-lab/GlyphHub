operations
loadWhere: aSelector equals: aValue into: aClass populate: aCollection
	| models |
	models := ((self getTable: aClass modelName)
		select: [ :e | (e at: aSelector asString ifAbsent: [nil]) = aValue ])
		collect: [ :e | self deserialize: e class: aClass ].
	
	self join: models class: aClass populate: aCollection.
	
	^BTPromise unit: models