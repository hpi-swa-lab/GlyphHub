as yet unclassified
deserialize: aDictionary class: aClass
	| model |
	model := aClass new markAllDirty: false.
	
	aClass instVarNames do: [ :name |
		model instVarNamed: name put: (aDictionary at: name asString ifAbsent: [nil]) ].
	
	model privateId: (aDictionary at: 'id').
	
	^model