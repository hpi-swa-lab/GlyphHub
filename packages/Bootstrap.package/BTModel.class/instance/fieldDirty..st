fields
fieldDirty: aSymbol

	| index |
	index := self class instVarNames indexOf: aSymbol ifAbsent: [self error: 'Field does not exist on this model'].
	dirtyFlags at: index put: true