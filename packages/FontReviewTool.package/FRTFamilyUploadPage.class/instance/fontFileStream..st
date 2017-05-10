accessing
fontFileStream: aFileStream
	
	| filename |
	fontFileStream := aFileStream.
	
	filename := (((fontFileStream name) asString) subStrings: '/') last.
	fontFileStream
		ifNotNil: [(uploadedFileLabel text: filename) ellipsize: #start]
		ifNil: [uploadedFileLabel text: 'none']