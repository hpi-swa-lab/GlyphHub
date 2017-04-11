private
request: path method: method data: anObject contentType: aString
	" pass in a path such as '/user', a method such as 'GET' or 'POST', data and a content type like 'text/plain'.
	  Returns a Promise that resolves with the decoded JSON or rejects with a BTHttpError "
	
	| promise isJsonResponse |
	promise := BTPromise new.
	[ | client request response url data |
		url := self apiRootUrl, path.
		client := WebClient new initializeFromUrl: url.
		request := (client requestWithUrl: url)
			headerAt: 'Accept-Encoding' put: 'gzip';
			headerAt: 'Content-Type' put: aString;
			headerAt: 'Content-Length' put: anObject size;
			headerAt: 'Authorization' put: self apiToken;
			method: method;
			yourself.
		
		response := client sendRequest: request content: anObject readStream size: anObject size.
		self flag: #TODO. "make sure this doesnt completely kill everyting if we send back a non-json response"
		data :=  (isJsonResponse := response content ~= '' and: [response isSuccess and: [(response headerAt: 'Content-Type') = 'application/json']])
			ifTrue: [Json readFrom: response content readStream]
			ifFalse: [response].
		
		Project current addDeferredUIMessage: [
			response isSuccess
				ifTrue: [ promise resolveWith: data ]
				ifFalse: [
					promise rejectWith: (BTHttpError new
						response: response;
						messageText: (isJsonResponse ifTrue: [(data at: '_error') at: 'message'] ifFalse: [data]);
						statusCode: response code;  
						yourself)]].
	] fork.
	
	^ promise