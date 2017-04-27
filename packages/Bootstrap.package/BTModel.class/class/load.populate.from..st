load-id
load: aNumber populate: aCollection from: aBackend
	
	^ (aBackend
		loadWhere: #id
		equals: aNumber
		into: self
		populate: aCollection)
		then: [:models | models onlyElement]