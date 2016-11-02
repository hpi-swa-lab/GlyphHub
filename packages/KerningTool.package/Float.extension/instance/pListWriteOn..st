*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<real>', (self asString), '</real>'