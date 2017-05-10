private
jsonToModel: aDictionaryOrArray modelClass: aClass
	
	^ aDictionaryOrArray isArray
		ifTrue: [self jsonArrayToModel: aDictionaryOrArray modelClass: aClass]
		ifFalse: [self jsonObjectToModel: aDictionaryOrArray modelClass: aClass]