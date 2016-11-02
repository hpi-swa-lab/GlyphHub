*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<string>', self, '</string>'