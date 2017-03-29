operations
saveTo: aBackend
	self isDirty ifFalse: [ ^BTPromise unit: self ].
	self isValid ifFalse: [ ^BTPromise new rejectWith: self ].
	
	^(aBackend save: self to: self class modelName) then: [ :model |
		querying := true.
		self flag: #todo. "chain promises correctly"
		[model
			markAllDirty: false;
			saveAssociationsTo: aBackend] ensure: [querying := false].
		model ]