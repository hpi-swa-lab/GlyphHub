private
jsonObjectToModel: aDictionary modelClass: aClass

	| instance |
	aDictionary ifNil: [^ nil].
	
	instance := aClass new
		backend: self;
		yourself.
	
	aClass nonAssociationFields do: [:name |
		instance set: name to: (aDictionary at: (self class camelCaseToUnderscore: name asString))].
	
	aClass associations keysAndValuesDo: [:field :association |
		aDictionary at: (self class camelCaseToUnderscore: field) ifPresent: [:json | | value |
			value := self jsonToModel: json modelClass: association foreignClass.
			
			instance instVarNamed: field put: value.
			
			value isBTModelList ifTrue: [
				value
					owner: instance;
					field: field;
					do: [:childModel | childModel set: association backPopulateKey to: instance]].
			value isBTModel ifTrue: [
				(value class associations at: association backPopulateKey) cardinality == #single
					ifTrue: [value set: association backPopulateKey to: instance]
					ifFalse: [(value perform: association backPopulateKey) add: instance]]]].
	
	^ instance
		privateId: (aDictionary at: '_id');
		markAllDirtyRecursively: false;
		yourself