private
addItemRoutesFor: anItemDictionary table: aTableDictionary tableName: aString
	server
		addService: '/', aString, '/', (anItemDictionary at: '_id')
		action: [ :req |
			req method = 'GET' ifTrue: [ req send200Response: anItemDictionary asJsonString contentType: 'application/json' ].
			
			req method = 'DELETE' ifTrue: [
				(aTableDictionary at: '_items' put: ((aTableDictionary at: '_items') copyWithout: anItemDictionary)).
				req send200Response: '' contentType: 'application/json' ].
			
			" dont actually bother updating, just send a valid response "
			req method = 'PATCH' ifTrue: [ req send200Response: anItemDictionary asJsonString contentType: 'application/json' ]]
		methods: ((server defaultHttpMethods copyWith: 'DELETE') copyWith: 'PATCH')