operations
delete: aNumber from: aTableNameString
	^(self request: aTableNameString, '/', aNumber asString method: 'DELETE' data: nil)
		then: [ :data | nil]