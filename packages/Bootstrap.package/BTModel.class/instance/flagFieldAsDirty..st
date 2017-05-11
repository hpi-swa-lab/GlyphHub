fields
flagFieldAsDirty: aSymbol

	| index |
	index := self class fieldNames indexOf: aSymbol ifAbsent: [self error: 'Field does not exist on this model'].
	dirtyFlags at: index put: true