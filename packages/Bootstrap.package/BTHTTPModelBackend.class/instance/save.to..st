operations
save: aModel to: aTableNameString
	| table |
	table := self camelCaseToUnderscore: aTableNameString.
	^ (self
		request: (aModel id == 0
			ifTrue: [table]
			ifFalse: [table, '/', aModel id])
		method: (aModel id == 0 ifTrue: ['POST'] ifFalse: ['PUT'])
		data: aModel dirtyFieldsAndValues)
		
		then: [:data |
			aModel id == 0
				ifTrue: [aModel privateId: (data at: '_id')]
				ifFalse: [aModel]]