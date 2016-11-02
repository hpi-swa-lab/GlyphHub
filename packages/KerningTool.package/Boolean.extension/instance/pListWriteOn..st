*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<', (self asString), '/>'