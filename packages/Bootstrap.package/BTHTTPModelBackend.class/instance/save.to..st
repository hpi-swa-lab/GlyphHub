as yet unclassified
save: aModel to: aTable
	^ (self
		request: aTable
		method: (aModel id == 0 ifTrue: ['POST'] ifFalse: ['PUT'])
		data: aModel dirtyFieldsAndValues)
		
		then: [:data |
			aModel id == 0
				ifTrue: [aModel privateId: (data at: '_id')]
				ifFalse: [aModel]]