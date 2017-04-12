operations
loadAllInto: aClass populate: aCollection

	| models |
	models := (self getTable: aClass modelName) collect: [ :entity | self deserialize: entity class: aClass ].

	self join: models class: aClass populate: aCollection.
	
	^ BTPromise unit: models