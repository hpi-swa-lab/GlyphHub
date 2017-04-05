fields
dirtyFieldsAndValues
	| dirtyFieldDictionary |
	
	dirtyFieldDictionary := OrderedDictionary new.
	self dirtyFieldNames do: [:field |
		dirtyFieldDictionary
			at: (BTHTTPModelBackend camelCaseToUnderscore: field)
			put: (self perform: field asSymbol)].
	^ dirtyFieldDictionary