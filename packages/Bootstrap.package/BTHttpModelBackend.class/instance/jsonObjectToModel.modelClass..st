private
jsonObjectToModel: aDictionary modelClass: aClass

	| instance |
	instance := aClass new
		backend: self;
		yourself.
	
	aClass nonAssociationFields do: [:name |
		instance instVarNamed: name put: (aDictionary at: (self class camelCaseToUnderscore: name asString))].
	
	aClass associations keysAndValuesDo: [:field :association |
		aDictionary at: field ifPresent: [:json | | value |
			value := self jsonToModel: json modelClass: association first.
			
			instance instVarNamed: field put: value.
			
			value isBTModelList ifTrue: [
				value
					owner: instance;
					field: field;
					do: [:childModel | childModel set: association second to: instance]].
			value isBTModel ifTrue: [
				(value class associations at: association second) third == #single
					ifTrue: [value set: association second to: instance]
					ifFalse: [(value perform: association second) add: instance]]]].
	
	^ instance
		privateId: (aDictionary at: '_id');
		markAllDirtyRecursively: false;
		yourself