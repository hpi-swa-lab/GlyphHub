load-id
load: aNumber populate: aCollection from: aBackend
	
	^ (aBackend
		loadWhere: #id
		equals: aNumber
		into: self
		populate: aCollection)
		"'models anyOne' has to be called because loadFrom:... always returns a BTModelList, even if we only receive one object"
		then: [ :models | models anyOne ]