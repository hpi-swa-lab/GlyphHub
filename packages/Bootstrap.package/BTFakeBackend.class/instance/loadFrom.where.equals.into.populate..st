as yet unclassified
loadFrom: aTableNameString where: aSelector equals: aValue into: aClass populate: aCollection
	| models |
	models := ((tables at: aTableNameString)
		select: [ :e | (e at: aSelector asString ifAbsent: [nil]) = aValue ])
		collect: [ :e | self deserialize: e class: aClass ].
	
	self join: models class: aClass populate: aCollection.
	
	^Promise unit: models