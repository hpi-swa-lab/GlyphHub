load-by
loadBy: aField value: anObject from: aBackend populate: aCollection

	^ aBackend
		loadWhere: aField
		equals: anObject
		into: self
		populate: aCollection