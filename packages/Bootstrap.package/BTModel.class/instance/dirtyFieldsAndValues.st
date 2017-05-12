fields
dirtyFieldsAndValues

	| dirtyFieldDictionary |	
	dirtyFieldDictionary := OrderedDictionary new.
	
	self dirtyFieldNames do: [:field | | value fieldName key |
		fieldName := BTHttpModelBackend camelCaseToUnderscore: field.
		value := (self perform: field asSymbol).
		key := (self class hasSingleAssociationNamed: field) ifTrue: [fieldName, '_id'] ifFalse: [fieldName].
		
		dirtyFieldDictionary
			at: key
			put: (value isBTModel ifTrue:[value id] ifFalse: [value])].
	
	^ dirtyFieldDictionary