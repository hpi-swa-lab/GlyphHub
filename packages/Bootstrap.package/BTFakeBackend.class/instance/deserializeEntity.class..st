as yet unclassified
deserializeEntity: aDictionary class: aClass
	| model |
	model := aClass new markAllDirty: false.
	
	aClass instVarNames do: [ :name |
		aDictionary
			at: name asString
			ifPresent: [ :value | model instVarNamed: name put: value ]].
	
	model privateId: (aDictionary at: 'id').
	
	^model