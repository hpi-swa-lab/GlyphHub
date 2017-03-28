as yet unclassified
open
	server := WebServer reset default.
	
	{userTable. fontTable} with: #('user' 'font') do: [ :table :tableName |
		" GET and POST to the collection, e.g. /user "
		server addService: '/', tableName action: [ :req |
			req method = 'GET' ifTrue: [ req send200Response: table asJsonString contentType: 'application/json' ].
			req method = 'POST' ifTrue: [ | item |
				item := Json readFrom: req content readStream.
				item at: '_id' put: (table at: '_items') size + 1.
				(table at: '_items') add: item.
				req send200Response: '{"_id":', (item at: '_id'), '}' contentType: 'application/json' ]].
		
		" GET and DELETE to the item, e.g. /user/2 "
		(table at: '_items') do: [ :item |
			server addService: '/', tableName, '/', (item at: '_id') action: [ :req |
				req method = 'GET' ifTrue: [ req send200Response: item asJsonString contentType: 'application/json' ].
				req method = 'DELETE' ifTrue: [ | failed |
					failed := false.
					(table at: '_items') remove: item ifAbsent: [ failed := true. req send404Response ].
					failed ifFalse: [ req send200Response: '' contentType: 'application/json' ]]]]].
	
	server listenOn: 8000