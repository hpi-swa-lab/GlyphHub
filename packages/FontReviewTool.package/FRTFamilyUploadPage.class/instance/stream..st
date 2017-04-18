accessing
stream: aStream
	
	| filename |
	stream := aStream.
	
	filename := (((stream name) asString) subStrings: '/') last.
	stream
		ifNotNil: [(uploadedFileLabel italic: filename) ellipsize: #start]
		ifNil: [uploadedFileLabel italic: 'none']