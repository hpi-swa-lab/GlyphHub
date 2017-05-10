accessing
imageFileStream: aFileStream
	
	| filename |
	imageFileStream := aFileStream.
	
	filename := (((imageFileStream name) asString) subStrings: '/') last.
	imageFileStream
		ifNotNil: [(uploadedFileLabel text: filename) ellipsize: #start]
		ifNil: [uploadedFileLabel text: 'none']