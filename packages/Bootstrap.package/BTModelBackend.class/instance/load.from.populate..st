operations
load: aNumber from: aTableNameString populate: aCollection

	^ self
		loadWhere: #id
		equals: aNumber
		into: self
		populate: aCollection