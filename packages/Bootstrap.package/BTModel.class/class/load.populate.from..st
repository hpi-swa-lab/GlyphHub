load-id
load: aNumber populate: aCollection from: aBackend
	^(aBackend
		loadFrom: self modelName
		where: #id
		equals: aNumber
		into: self
		populate: aCollection) then: [ :models | models first ]