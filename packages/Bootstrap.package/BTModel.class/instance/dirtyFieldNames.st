fields
dirtyFieldNames
	
	^ self class instVarNames select: [:var |
		dirtyFlags at: (self class instVarNames indexOf: var)]