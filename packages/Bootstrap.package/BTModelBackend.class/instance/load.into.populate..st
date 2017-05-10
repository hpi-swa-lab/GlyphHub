operations
load: aNumber into: aClass populate: aCollection
	" overwrite this if you have a more efficient method for loading by id directly "

	^ (self
		loadWhere: {#id -> aNumber}
		into: aClass
		populate: aCollection) then: #onlyElement