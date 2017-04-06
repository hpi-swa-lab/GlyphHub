initialize-release
open
	" starts the server and returns the port it's running on "
	| port |
	server := WebServer reset default.
	port := self ephemeralPort.
	
	" route for easy check whether we managed to start (FIXME feel free to do this better) "
	server addService: '/alive' action: [ :req | req send200Response: 'ok' ].
	
	" mocked login route, 'peter' and 'geheim' will get you a 200 "
	server addService: '/login' action: [ :req |
		req method = 'POST'
			ifTrue: [ | item |
				item := Json readFrom: req content readStream.
				((item at: 'username') = 'peter' and: [(item at: 'password') = 'geheim'])
					ifTrue: [	req send200Response: '{"token":"sadasdasdasdasd","user_id":1}']
					ifFalse: [req sendResponseCode: 401 content: '' type: 'text/plain' close: true]]
			ifFalse: [req sendResponseCode: 405 content: '' type: 'text/plain' close: true]].
	
	" send back a family, replies as if sent as /family/1?embedded={'fonts':1} (aka with the fonts collection populated) "
	server addService: '/family/1' action: [ :req | req send200Response: familyReply ].
	
	" send back a comment, replies as if sent as /comment/1?embedded={'author':1} (aka with the author model populated) "
	server addService: '/comment/1' action: [ :req | req send200Response: commentReply ].
	
	" send back a thread, populated with comments, comment authors, glyphs "
	server addService: '/thread/1' action: [ :req | req send200Response: threadReply ].
	
	{userTable. fontTable} with: #('user' 'font') do: [ :table :tableName |
		" GET and POST to the collection, e.g. /user "
		server addService: '/', tableName action: [ :req |
			req method = 'GET' ifTrue: [ req send200Response: table asJsonString contentType: 'application/json' ].
			req method = 'POST' ifTrue: [ | item |
				item := Json readFrom: req content readStream.
				item at: '_id' put: (table at: '_items') size + 1.
				(table at: '_items' put: ((table at: '_items') copyWith: item)).
				self addItemRoutesFor: item table: table tableName: tableName.  
				req send200Response: '{"_id":', (item at: '_id'), '}' contentType: 'application/json' ]].
		
		" GET and DELETE to the item, e.g. /user/2 "
		(table at: '_items') do: [ :item |
			self addItemRoutesFor: item table: table tableName: tableName ]].
	
	server listenOn: port.
	
	(WebClient new timeout: 1; httpGet: 'http://127.0.0.1:', port asString, '/alive') code = 200
		ifFalse: [ self error: 'Mock server failed to start properly' ].
		
	^port