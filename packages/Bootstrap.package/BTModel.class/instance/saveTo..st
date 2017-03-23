operations
saveTo: aBackend
	self isDirty ifFalse: [ ^Promise unit: self ].
	self isValid ifFalse: [ ^Promise new rejectWith: self ].
	
	^(aBackend save: self to: self class modelName) then: [ :model |
		querying := true.
		self flag: #todo. "chain promises correctly"
		[model
			markAllDirty: false;
			saveAssociationsTo: aBackend] ensure: [querying := false].
		model ]