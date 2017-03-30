operations
delete: aNumber from: aTableNameString
	^(self
		request: (self camelCaseToUnderscore: aTableNameString), '/', aNumber asString
		method: 'DELETE'
		data: nil)