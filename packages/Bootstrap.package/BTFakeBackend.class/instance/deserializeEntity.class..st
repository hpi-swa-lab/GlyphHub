as yet unclassified
deserializeEntity: aDictionary class: aClass
	| model |
	model := aClass new.
	
	aClass fieldNames do: [ :name |
		aDictionary
			at: name asString
			ifPresent: [ :value | model set: name to: value ]].
	
	model
		privateId: (aDictionary at: 'id');
		markAllDirty: false.
	
	^model