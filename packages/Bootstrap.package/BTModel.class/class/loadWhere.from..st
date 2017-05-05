load-by
loadWhere: aSelectorValueDictionary from: aBackend

	^ self
		loadWhere: aSelectorValueDictionary
		populate: #()
		from: aBackend