font-upload
upload: aFileStream toFamily: anIdNumber commitMessage: aString

	| boundary file data |
	boundary := WebUtils multipartBoundary.
	file := (MIMELocalFileDocument contentType: 'text/plain' content: '' url: 'file://', aFileStream name) contentStream: (aFileStream binary; yourself).
	
	data := String streamContents: [:stream |
		stream
			" message field "
			nextPutAll: '--'; nextPutAll: boundary;
			crlf;
			nextPutAll: 'Content-Disposition: form-data; ';
			nextPutAll: 'name="commit_message"';
			crlf;
			crlf;
			nextPutAll: aString;
			crlf;

			" file field "		
			nextPutAll: '--'; nextPutAll: boundary;
			crlf;
			nextPutAll: 'Content-Disposition: form-data; ';
			nextPutAll: 'name="file"; ';
			nextPutAll: 'filename="'; nextPutAll: aFileStream name; nextPut: $";
			crlf;
			crlf;
			nextPutAll: file content asString;
			crlf;
			nextPutAll: '--'; nextPutAll: boundary; nextPutAll: '--'].
	
	^ self
		request: 'family/', anIdNumber, '/upload'
		method: 'POST'
		data: data
		contentType: 'multipart/form-data; boundary=', boundary