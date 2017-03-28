private
request: path method: method data: anObject
	" pass in a path such as '/user', a method such as 'GET' or 'POST' and data, like a Dictionary, or nil.
	  Returns a Promise that resolves with the decoded JSON or rejects with a BTHttpError "
	| promise isJsonResponse |
	promise := Promise new.
	[ | client request response url data |
		url := self apiRootUrl, path.
		data := anObject ifNotNil: [ anObject asJsonString squeakToUtf8 ] ifNil: [ '' ].
		client := WebClient new initializeFromUrl: url.
		request := (client requestWithUrl: url)
			headerAt: 'Accept-Encoding' put: 'gzip';
			headerAt: 'Content-Type' put: 'application/json';
			headerAt: 'Content-Length' put: data size;
			headerAt: 'Authorization' put: self apiToken;
			method: method;
			yourself.
		
		response := client sendRequest: request content: data readStream size: data size.
		(isJsonResponse := response content ~= '' and: [response isSuccess])
			ifTrue: [data := Json readFrom: response content readStream].
		
		response isSuccess
			ifTrue: [ promise resolveWith: data ]
			ifFalse: [
				promise rejectWith: (BTHttpError new
					response: data;
					messageText: (isJsonResponse ifTrue: [(data at: '_error') at: 'message'] ifFalse: [data]);
					statusCode: response code;  
					yourself) ].
	] fork.
	
	^promise