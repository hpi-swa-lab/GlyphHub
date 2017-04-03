operations
saveTo: aBackend

	self isDirty ifFalse: [ ^ BTPromise unit: self ].
	self isValid ifFalse: [ ^ BTPromise new rejectWith: self ].
	
	^ ((aBackend save: self to: self class modelName)
		then: [ :model | | promise |
			querying := true.
			[promise := model
				markAllDirty: false;
				saveAssociationsTo: aBackend] ensure: [querying := false].
			promise ])
		then: [ :x | self ]