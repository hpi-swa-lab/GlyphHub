load-by
loadWhere: aSelectorValueDictionary populate: aCollection from: aBackend

	^ aBackend
		loadFrom: self modelName
		where: aSelectorValueDictionary
		into: self
		populate: aCollection