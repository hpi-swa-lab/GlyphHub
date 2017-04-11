operations
delete: aNumber from: aTableNameString

	^ (self
		request: (self class camelCaseToUnderscore: aTableNameString), '/', aNumber asString
		method: 'DELETE'
		data: nil)