operations
load: aNumber into: aClass populate: aCollection

	^ entities
		detect: [:entity | entity class = aClass and: [entity id = aNumber]]
		ifFound: [:entity | self resolveWith: entity populate: aCollection]
		ifNone: [self rejectBecauseNotFound]