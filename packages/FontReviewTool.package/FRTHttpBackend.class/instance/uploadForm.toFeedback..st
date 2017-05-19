image-upload
uploadForm: aForm toFeedback: anIdNumber

	| boundary file data pngStream |
	boundary := WebUtils multipartBoundary.
	pngStream := (ReadWriteStream on: (ByteArray new: 1024))
		binary;
		yourself.
	PNGReadWriter putForm: aForm onStream: pngStream.
	file := (MIMELocalFileDocument contentType: 'text/plain' content: '' url: 'file://file.png') contentStream: pngStream.
	
	data := String streamContents: [:stream |
		stream
			" file field "
			nextPutAll: '--'; nextPutAll: boundary;
			crlf;
			nextPutAll: 'Content-Disposition: form-data; ';
			nextPutAll: 'name="file"; ';
			nextPutAll: 'filename="file.png"';
			crlf;
			crlf;
			nextPutAll: file content asString;
			crlf;
			nextPutAll: '--'; nextPutAll: boundary; nextPutAll: '--'].
	
	^ self
		request: 'feedback/', anIdNumber, '/image'
		method: 'POST'
		data: data
		contentType: 'multipart/form-data; boundary=', boundary