load-by
loadWhere: aField equals: anObject from: aBackend populate: aCollection

	^ aBackend
		loadWhere: {aField -> anObject}
		into: self
		populate: aCollection