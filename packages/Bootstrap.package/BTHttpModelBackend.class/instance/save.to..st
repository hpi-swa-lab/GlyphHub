operations
save: aModel to: aTableNameString

	| table |
	table := self class camelCaseToUnderscore: aTableNameString.
	
	aModel backend: self.
	^ (self
		request: (aModel id == 0
			ifTrue: [table]
			ifFalse: [table, '/', aModel id])
		method: (aModel isCreated ifTrue: ['PATCH'] ifFalse: ['POST'])
		data: aModel dirtyFieldsAndValues)
		
		then: [:data |
			aModel id == 0
				ifTrue: [aModel privateId: (data at: '_id')]
				ifFalse: [aModel]]