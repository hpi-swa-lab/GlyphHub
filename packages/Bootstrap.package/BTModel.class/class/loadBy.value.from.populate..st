load-by
loadBy: aField value: anObject from: aBackend populate: aCollection
	^aBackend
		loadFrom: self modelName
		where: aField
		equals: anObject
		into: self
		populate: aCollection