operations
save: aModel to: aTableNameString

	aModel isCreated
		ifFalse: [aModel privateId: self nextId].
	
	aModel backend: nil.
	entities at: aModel id put: (aModel copy releaseAssociationsIfUncreatedEntityDo: [:entity |
		entity privateId: self nextId]).
	aModel backend: self.
	
	^ BTPromise unit: aModel