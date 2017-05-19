fields
dirtyFieldNames
	" get a list of all primitive dirty fields and all #single associations that are dirty "
	
	^ self class fieldNames select: [:var |
		(self class hasManyAssociationNamed: var) not and:
		[(self class excludeInstVar: var) not and:
		[dirtyFlags at: (self class fieldNames indexOf: var)]]]