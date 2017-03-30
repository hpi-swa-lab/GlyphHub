private
request: path method: method data: anObject
	" Send JSON data to a server.
	  Pass in a path such as '/user', a method such as 'GET' or 'POST' and data, like a Dictionary, or nil.
	  Returns a Promise that resolves with the decoded JSON or rejects with a BTHttpError "
	^self
		request: path
		method: method
		data: (anObject ifNotNil: [ anObject asJsonString squeakToUtf8 ] ifNil: [ '' ])
		contentType: 'application/json'