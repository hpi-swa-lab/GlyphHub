as yet unclassified
printOn: aStream

	aStream nextPutAll: self class name, '('; nextPutAll: self glyphName; nextPut: $)