operations
loadWhere: anAssociationList into: aClass populate: aCollection
	| models |
	models := (self getTable: aClass modelName)
		select: [:e | anAssociationList allSatisfy: [:association | (e at: association key asString ifAbsent: [nil]) = association value]]
		thenCollect: [:e | self deserialize: e class: aClass].
	
	self join: models class: aClass populate: aCollection.
	
	^ BTPromise unit: models