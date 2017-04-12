load-by
loadWhere: aSelectorValueDictionary populate: aCollection from: aBackend

	^ aBackend
		loadWhere: aSelectorValueDictionary
		into: self
		populate: aCollection