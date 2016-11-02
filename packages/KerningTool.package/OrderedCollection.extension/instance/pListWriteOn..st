*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter stream nextPutAll: '<array>'.
	self do: [ :pListElement | pListElement pListWriteOn: anXMLWriter].
	anXMLWriter stream nextPutAll: '</array>'