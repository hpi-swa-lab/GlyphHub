fields
dirtyFieldsAndValues
	| dirtyFieldDictionary |
	
	dirtyFieldDictionary := OrderedDictionary new.
	
	self dirtyFieldNames do: [:field | | value fieldName key |
		fieldName := BTHttpModelBackend camelCaseToUnderscore: field.
		value := (self perform: field asSymbol).
		key := value isBTModel ifTrue: [fieldName, '_id'] ifFalse: [fieldName].
		
		dirtyFieldDictionary
			at: key
			put: (value isBTModel ifTrue:[value id] ifFalse: [value])].
	
	^ dirtyFieldDictionary