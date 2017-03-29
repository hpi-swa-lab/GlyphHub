font-upload
upload: aFileStream toFont: anIdNumber
	| boundary file |
	boundary := WebUtils multipartBoundary.
	file := (MIMELocalFileDocument contentType: 'text/plain' content: nil url: 'file://', aFileStream name) contentStream: aFileStream.
	
	String streamContents: [ :stream |
		stream
			nextPutAll: '--'; nextPutAll: boundary;
			crlf;
			nextPutAll: 'Content-Disposition: form-data; ';
			nextPutAll: 'name="file"; ';
			nextPutAll: 'filename="'; nextPutAll: aFileStream name; nextPut: $";
			crlf;
			crlf;
			nextPutAll: file content asString;
			crlf;
			nextPutAll: '--'; nextPutAll: boundary; nextPutAll: '--' ].
	
	^self
		request: 'font/', anIdNumber, '/upload'
		method: 'POST'
		data: (WebUtils encodeMultipartForm: {'file' -> file} boundary: boundary)
		contentType: 'multipart/form-data; boundary=', boundary