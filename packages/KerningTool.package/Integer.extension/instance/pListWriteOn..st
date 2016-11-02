*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<integer>', (self asString), '</integer>'