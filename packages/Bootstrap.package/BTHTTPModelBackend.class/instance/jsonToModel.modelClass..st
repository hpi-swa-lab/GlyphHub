operations
jsonToModel: aDictionary modelClass: aClass
	| instance |
	instance := aClass new.
	aClass instVarNames do: [ :name |
		instance instVarNamed: name put: (aDictionary at: name asString)].
	instance privateId: (aDictionary at: '_id').
	^instance