operations
loadAllFrom: aString into: aClass populate: aCollection

	| models |
	models := (self getTable: aString) collect: [ :entity | self deserialize: entity class: aClass ].

	self join: models class: aClass populate: aCollection.
	
	^ BTPromise unit: models