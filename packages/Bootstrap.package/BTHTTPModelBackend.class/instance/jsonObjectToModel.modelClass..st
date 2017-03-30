private
jsonObjectToModel: aDictionary modelClass: aClass
	| instance |
	instance := aClass new.
	
	aClass instVarNames do: [ :name |
		instance instVarNamed: name put: (aDictionary at: (self camelCaseToUnderscore: name asString)) ].
	
	aClass associations keysAndValuesDo: [ :field :association |
		aDictionary at: field ifPresent: [ :json |
			instance instVarNamed: field put: (self jsonToModel: json modelClass: association first) ]].
	
	instance privateId: (aDictionary at: '_id').
	^instance