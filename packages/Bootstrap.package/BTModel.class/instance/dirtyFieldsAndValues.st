fields
dirtyFieldsAndValues
	| dirtyFieldDictionary |
	
	dirtyFieldDictionary := OrderedDictionary new.
	self dirtyFieldNames do: [:field |
		dirtyFieldDictionary
			at: (BTHttpModelBackend camelCaseToUnderscore: field)
			put: (self perform: field asSymbol)].
	^ dirtyFieldDictionary