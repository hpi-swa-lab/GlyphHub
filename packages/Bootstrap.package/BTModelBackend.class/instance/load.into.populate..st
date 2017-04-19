operations
load: aNumber into: aClass populate: aCollection

	^ self
		loadWhere: #id
		equals: aNumber
		into: aClass
		populate: aCollection