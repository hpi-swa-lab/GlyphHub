as yet unclassified
request: path method: method data: anObject
	" pass in a path such as '/user', a method such as 'GET' or 'POST' and data, like a Dictionary, or nil.
	  Returns a Promise that resolves with the decoded JSON or rejects with a BTHttpError "
	| promise |
	promise := Promise new.
	[ | client req res url data |
		url := self apiRootUrl, path.
		data := anObject ifNotNil: [ anObject asJsonString squeakToUtf8 ] ifNil: [ '' ].
		client := WebClient new initializeFromUrl: url.
		req := (client requestWithUrl: url)
			headerAt: 'Accept-Encoding' put: 'gzip';
			headerAt: 'Content-Type' put: 'application/json';
			headerAt: 'Content-Length' put: data size;
			method: method;
			yourself.
		
		res := client sendRequest: req content: data readStream size: data size.
		data := Json readFrom: res content readStream.
		
		res isSuccess
			ifTrue: [ promise resolveWith: data ]
			ifFalse: [
				promise rejectWith: (BTHttpError new
					response: data;
					messageText: ((data at: '_error') at: 'message');
					statusCode: res code;  
					yourself) ].
	] fork.
	
	^promise