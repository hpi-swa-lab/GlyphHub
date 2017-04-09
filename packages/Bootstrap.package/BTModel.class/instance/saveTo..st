operations
saveTo: aBackend

	" if we're already saving, return that promise "
	savePromise ifNotNil: [^savePromise].

	self isDirty ifFalse: [^ BTPromise unit: self].
	self isValid ifFalse: [^ BTPromise new rejectWith: (BTModelValidationFailure new model: self; yourself)].
	
	savePromise := self hasDirtyFields
		ifTrue: [aBackend save: self to: self class modelName]
		ifFalse: [BTPromise unit: self].
	
	^ ((savePromise
		then: [ :model | | promise |
			savePromise := nil.
			querying := true.
			[promise := model
				markAllDirty: false;
				saveAssociationsTo: aBackend] ensure: [querying := false].
			promise ])
		then: [self])
		catch: [:error | savePromise := nil. error signal]