font-upload
uploadForm: aForm toComment: anIdOrComment

	| boundary file data id pngStream |
	boundary := WebUtils multipartBoundary.
	pngStream := ReadWriteStream new
		binary;
		yourself.
	PNGReadWriter putForm: aForm onStream: pngStream.
	file := (MIMELocalFileDocument contentType: 'text/plain' content: nil url: 'file://file.png') contentStream: pngStream.
	id := anIdOrComment isBTModel ifTrue: [anIdOrComment id] ifFalse: [anIdOrComment].
	
	data := String streamContents: [:stream |
		stream
			" file field "
			nextPutAll: '--'; nextPutAll: boundary;
			crlf;
			nextPutAll: 'Content-Disposition: form-data; ';
			nextPutAll: 'name="file"; ';
			nextPutAll: 'filename="'; nextPutAll: stream name; nextPut: $";
			crlf;
			crlf;
			nextPutAll: file content asString;
			crlf;
			nextPutAll: '--'; nextPutAll: boundary; nextPutAll: '--'].
	
	^ self
		request: 'comment/', id, '/attachment'
		method: 'POST'
		data: data
		contentType: 'multipart/form-data; boundary=', boundary