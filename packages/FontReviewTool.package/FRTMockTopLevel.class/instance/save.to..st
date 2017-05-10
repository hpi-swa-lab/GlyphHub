operations
save: aModel to: aTableNameString

	aModel backend: self.
	
	aModel isCreated
		ifFalse: [aModel privateId: self nextId].
	
	entities at: aModel id put: aModel veryDeepCopy.
	
	^ BTPromise unit: aModel