load-by
loadBy: aField value: anObject populate: aCollection

	^ self
		loadWhere: aField
		equals: anObject
		into: self
		populate: aCollection