fields
dirtyFieldNames
	" get a list of all primitive dirty fields and all #single associations that are dirty "
	
	^ self class fieldNames select: [:var |
		(self class associations at: var ifPresent: [:association | association cardinality == #single] ifAbsent: [true]) and:
		(dirtyFlags at: (self class fieldNames indexOf: var))]