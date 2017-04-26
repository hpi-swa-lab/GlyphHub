accessing
fontFileStream: aFileStream
	
	| filename |
	fontFileStream := aFileStream.
	
	filename := (((fontFileStream name) asString) subStrings: '/') last.
	fontFileStream
		ifNotNil: [(uploadedFileLabel italic: filename) ellipsize: #start]
		ifNil: [uploadedFileLabel italic: 'none']