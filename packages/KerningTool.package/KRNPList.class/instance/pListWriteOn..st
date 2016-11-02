as yet unclassified
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<plist version=''1.0''>'.
	self content pListWriteOn: anXMLWriter.
	anXMLWriter stream nextPutAll: '</plist>'