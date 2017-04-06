operations
saveTo: aBackend

	| savePromise |
	self isDirty ifFalse: [^ BTPromise unit: self].
	self isValid ifFalse: [^ BTPromise new rejectWith: (BTModelValidationFailure new model: self; yourself)].
	
	savePromise := self hasDirtyFields
		ifTrue: [aBackend save: self to: self class modelName]
		ifFalse: [BTPromise unit: self].
	
	^ (savePromise
		then: [ :model | | promise |
			querying := true.
			[promise := model
				markAllDirty: false;
				saveAssociationsTo: aBackend] ensure: [querying := false].
			promise ])
		then: [ :x | self ]