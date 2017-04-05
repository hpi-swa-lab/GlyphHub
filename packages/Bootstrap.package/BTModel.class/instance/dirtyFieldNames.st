fields
dirtyFieldNames
	
	^ self class instVarNames select: [:var |
		(self class associations includesKey: var) not and:
		(dirtyFlags at: (self class instVarNames indexOf: var))]