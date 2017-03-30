operations
populateString: aCollection
	^'embedded=', ((aCollection collect: [ :fieldName | fieldName -> 1 ]) as: Dictionary) asJsonString