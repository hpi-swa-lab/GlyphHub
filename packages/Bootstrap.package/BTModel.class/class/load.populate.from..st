load-id
load: aNumber populate: aCollection from: aBackend
	^(aBackend
		loadBy: #id
		value: aNumber
		from: self modelName
		class: self
		populate: aCollection) then: [ :models | models first ]